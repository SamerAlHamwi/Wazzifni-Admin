


import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/common/models/company_model.dart';
import '../../../../../core/common/models/job_model.dart';
import '../use_case/get_job_use_case.dart';
import '../use_case/get_jobs_use_case.dart';

class JobsRepository extends CoreRepository {

  ///Jobs list
  Future<Result<JobsListModel>> getAllJobs({required GetJobsParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getAllWorkPost,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobsListResponse.fromJson(json),
      responseStr: 'JobsListResponse',
    );
    return call(result: result);
  }


  Future<Result<List<JobModel>>> getAllJobs2({required GetJobsParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getAllWorkPost,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobsListResponse.fromJson(json),
      responseStr: 'JobsListResponse',
    );
    return paginatedCall(result: result);
  }

  ///Job Details
  Future<Result<JobModel>> getJobDetails({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getWorkPost,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobsDetailsResponse.fromJson(json),
      responseStr: 'JobsDetailsResponse',
    );
    return call(result: result);
  }

  ///Company Details
  Future<Result<Company>> getCompanyDetails({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getCompanyAccount,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => CompanyDetailsResponse.fromJson(json),
      responseStr: 'CompanyDetailsResponse',
    );
    return call(result: result);
  }


  // ///Application job list
  // Future<Result<JobApplicationListModel>> getAllApplications({required GetApplicationJobsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //     withAuthentication: true,
  //     url: ApiURLs.getAllWorkApplication,
  //     method: HttpMethod.GET,
  //     queryParameters: params.toJson(),
  //     converter: (json) => JobApplicationListResponse.fromJson(json),
  //     responseStr: 'JobApplicationListResponse',
  //   );
  //   return call(result: result);
  // }
  //
  // Future<Result<List<JobApplicationModel>>> getAllApplicationJob({required GetApplicationJobsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //     withAuthentication: true,
  //     url: ApiURLs.getAllWorkApplication,
  //     method: HttpMethod.GET,
  //     queryParameters: params.toJson(),
  //     converter: (json) => JobApplicationListResponse.fromJson(json),
  //     responseStr: 'JobApplicationListResponse',
  //   );
  //   return paginatedCall(result: result);
  // }
  //
  // ///Application job details
  // Future<Result<UserProfileModel>> getUserProfile({required GetJobParams params}) async {
  //   final result = await RemoteDataSource.request(
  //     withAuthentication: true,
  //     url: ApiURLs.getUserProfile,
  //     method: HttpMethod.GET,
  //     queryParameters: params.toJson(),
  //     converter: (json) => UserProfileResponse.fromJson(json),
  //     responseStr: 'UserProfileResponse',
  //   );
  //   return call(result: result);
  // }
  //
  // ///Approve or reject employee
  // Future<Result<dynamic>> approveRejectApplication({required ApproveRejectApplicationParams params}) async {
  //   final result = await RemoteDataSource.noModelRequest(
  //     url: params.isApprove ?  ApiURLs.approveWorkApplication : ApiURLs.rejectWorkApplication,
  //     method: HttpMethod.POST,
  //     withAuthentication: true,
  //     data: params.toJson(),
  //   );
  //   return noModelCall(result: result);
  // }
  //
  //
  // ///Company Statistics
  // Future<Result<CompanyStatisticsModel>> getCompanyStatistics({required CompanyStatisticsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //     withAuthentication: true,
  //     url: ApiURLs.getCompanyStatistics,
  //     method: HttpMethod.GET,
  //     queryParameters: params.toJson(),
  //     converter: (json) => CompanyStatisticsResponse.fromJson(json),
  //     responseStr: 'CompanyStatisticsResponse',
  //   );
  //   return call(result: result);
  // }
  //
  //
  // ///Delete Job
  // Future<Result<dynamic>> deleteWorkApplication({required DeleteJobParams params}) async {
  //   final result = await RemoteDataSource.noModelRequest(
  //     url: ApiURLs.deleteWorkApplication,
  //     method: HttpMethod.DELETE,
  //     withAuthentication: true,
  //     queryParameters: params.toJson(),
  //   );
  //   return noModelCall(result: result);
  // }
  //
  // ///Notifications
  // Future<Result<List<NotificationModel>>> getAllNotifications({required NotificationsParams params}) async {
  //   final result = await RemoteDataSource.request(
  //     withAuthentication: true,
  //     url: ApiURLs.getAllNotifications,
  //     method: HttpMethod.GET,
  //     queryParameters: params.toJson(),
  //     converter: (json) => NotificationListResponse.fromJson(json),
  //     responseStr: 'NotificationListResponse',
  //   );
  //   return paginatedCall(result: result);
  // }

}