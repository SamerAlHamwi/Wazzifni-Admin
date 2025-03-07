


import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wazzifni_admin/core/boilerplate/api/http/api_urls.dart';
import 'package:wazzifni_admin/core/constants/constants.dart';
import '../../../utils/utils.dart';
import '../core_models/models_factory.dart';
import '../errors/bad_request_error.dart';
import '../errors/base_error.dart';
import '../errors/cancel_error.dart';
import '../errors/conflict_error.dart';
import '../errors/custom_error.dart';
import '../errors/forbidden_error.dart';
import '../errors/http_error.dart';
import '../errors/internal_server_error.dart';
import '../errors/net_error.dart';
import '../errors/not_found_error.dart';
import '../errors/socket_error.dart';
import '../errors/timeout_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unknown_error.dart';
import 'http_method.dart';
import 'package:http_parser/http_parser.dart';


class ApiProvider {
  static var options = BaseOptions(
    baseUrl: ApiURLs.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    validateStatus: (status) => true,
  );
  static final Dio dio = Dio(options);
  static Future<Either<BaseError, T>> uploadFile<T>({
    required String url,
    required String fileKey,
    required File file,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    required String strString,
  }) async {
    final Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap.addAll(data);
    }
    final Map<String, dynamic> queryMap = {};
    if (queryParameters != null) {
      queryMap.addAll(queryParameters);
    }
    List<MultipartFile> multipartFiles = [];
    String fileName = file.path.split("/").last;
    multipartFiles.add(await MultipartFile.fromFile(file.path, filename: fileName));

    dataMap.addAll({fileKey: multipartFiles, 'MnD': 'MnD'});

    try {
      final response = await dio.post(
        url,
        data: FormData.fromMap(dataMap),
        options: Options(headers: headers),
        queryParameters: queryMap,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      // Get the decoded json
      var decodedJson;
      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }
      if (decodedJson['result'] == null) decodedJson['result'] = {'id': 0, 'file': ''};

      return Right(ModelsFactory.getInstance()!.createModel<T>(decodedJson, strString));
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return const Left(SocketError(message: 'please check your connection'));
    }
  }

  static Future<Either<BaseError, T>> sendObjectRequest<T>({
    required HttpMethod method,
    required String url,
    data, //Map<String, dynamic>?
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? files,
    bool isImageType = true,
    CancelToken? cancelToken,
    required String strString,
  }) async {
    try {

      dio.interceptors.add(RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 1, // retry count
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ));

      Options options = Options(
        headers: headers,
        contentType: Headers.jsonContentType,
        validateStatus: (status) => true,
        sendTimeout: files == null ? const Duration(minutes: 2) : null,
      );


      if (files != null && files.isNotEmpty) {
        headers!.remove(HEADER_CONTENT_TYPE);
        FormData formData = FormData.fromMap(data ?? {});

        for (var entry in files.entries) {
          if (entry.value.isNotEmpty) {
            formData.files.add(
              MapEntry(
                entry.key,
                await MultipartFile.fromFile(
                  entry.value,
                  filename: entry.value.split('/').last,
                  contentType: isImageType ? MediaType("image", "jpeg") : MediaType("application", "pdf"),
                ),
              ),
            );
          }
        }
        data = formData;  // Assign FormData instead of a map
      } else {
        data = data ?? {}; // Keep it as a JSON map if no files exist
      }



      Response response;

      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
            options: options,
          );

          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
          break;
      }
      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};
      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          if (decodedJson['result'] != null) {
            return Right(ModelsFactory.getInstance()!.createModel<T>(decodedJson, strString));
          } else {
            return const Left(CustomError(
              errorMessage: 'Data Not Found',
            ));
          }
        } else {
          return Left(CustomError(
            errorMessage: decodedJson['error']['message'],
          ));
        }
        // Return the http response with actual data
      } else {
        Utils.showToast(decodedJson['error']['message'] ?? '');
        return Left(CustomError(
          errorMessage: decodedJson['error']['message'],
        ));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return const Left(SocketError(message: 'please check your connection'));
    }
  }

  static Future<Either<BaseError, bool>> sendObjectWithOutResponseRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {

      dio.options.headers = headers;
      dio.options.validateStatus = (status) => true;

      // Get the response from the server
      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ,
          );
          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};

      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          return const Right(true);
        } else {
          return Left(CustomError(
            errorMessage: decodedJson['errors'],
          ));
        }
      }
      // Return the http response with actual data
      else {
        return Left(CustomError(
          errorMessage: decodedJson['errors'],
        ));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      return const Left(SocketError(message: 'please check your connection'));
    }
  }

  static Future<Either<BaseError, T>> sendObjectWithResponseRequest<T>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      dio.options.headers = headers;
      dio.options.validateStatus = (status) => true;


      Response response;
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data,
            queryParameters: queryParameters ?? {},
          );
          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
          );
          break;
      }

      // Get the decoded json
      var decodedJson;

      if (response.data is String) {
        decodedJson = json.decode(response.data);
      } else {
        decodedJson = response.data;
      }

      if (decodedJson['result'] == false || decodedJson['result'] == true) decodedJson['result'] = {'': ''};
      if ((response.statusCode)! > 199 && (response.statusCode)! < 300) {
        if (decodedJson['success'] == true) {
          return Right(decodedJson['data'] ?? true);
        } else {
          return Left(CustomError(
            errorMessage: decodedJson['errors'],
          ));
        }
      }
      // Return the http response with actual data
      else {
        return Left(CustomError(
          errorMessage: decodedJson['errors'],
        ));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Left(handleDioError(e));
    }

    on SocketException catch (e, stacktrace) {
      return const Left(SocketError(message: 'please check your connection'));
    }
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static BaseError handleDioError(DioException error) {
    if (error.type != DioExceptionType.unknown) {
      if (error is SocketException) return const SocketError(message: 'please check your connection');
      switch (error.response!.statusCode) {
        case 400:
          String errors = '';
          if (error.response!.data['error']['message'] is String) {
            errors = error.response?.data['error']['message'];
          } else {
            errors = error.response!.data['error']['message'];
          }
          return BadRequestError(message: error.response!.data['error']['message']);
        case 401:
          return UnauthorizedError();
        case 403:
          return ForbiddenError();
        case 404:
          return NotFoundError(message: error.message!);
        case 409:
          return ConflictError(message: error.response!.data['error']['message'], code: error.response!.data['code']);
        case 500:
          return InternalServerError();
        default:
          return HttpError(message: error.response!.data['error']['message']);
      }
      return const NetError(message: 'please check your connection');
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const TimeoutError(errorMessage: 'please_check_your_connection');
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return const UnknownError(errorMessage: 'please_check_your_connection');
    }
  }
}
