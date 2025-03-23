




import '../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../core/boilerplate/results/result.dart';
import '../../../../core/common/models/cities_response.dart';
import '../../../splash/data/use_case/cities_use_case.dart';
import '../model/login_model.dart';
import '../use_case/login_use_case.dart';

class AuthRepository extends CoreRepository {

  ///Login
  Future<Result<LoginModel>> login({required LoginParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: false,
        url: ApiURLs.login,
        method: HttpMethod.POST,
        queryParameters: {},
        data: params.toJson(),
        converter: (json) => LoginResponse.fromJson(json),
        responseStr: 'login'
    );
    return call(result: result);
  }

  ///Cities
  Future<Result<CityListModel>> getCities({required CitiesParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: false,
      url: ApiURLs.allCities,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => CityListResponse.fromJson(json),
      responseStr: 'CreateUserResponse',
    );
    return call(result: result);
  }

}