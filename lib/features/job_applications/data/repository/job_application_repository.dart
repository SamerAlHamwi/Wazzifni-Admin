





import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../core/common/models/job_application_model.dart';
import '../../../job_applications/data/use_case/approve_reject_employee_use_case.dart';
import '../../../job_applications/data/use_case/get_applications_job_use_case.dart';
import '../../../publish_job/data/use_case/delete_work_post_use_case.dart';


class JobApplicationRepository extends CoreRepository {


  ///Application job list
  Future<Result<JobApplicationListModel>> getAllApplications({required GetApplicationJobsParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getAllWorkApplication,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobApplicationListResponse.fromJson(json),
      responseStr: 'JobApplicationListResponse',
    );
    return call(result: result);
  }

  Future<Result<List<JobApplicationModel>>> getAllApplicationJob({required GetApplicationJobsParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getAllWorkApplication,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => JobApplicationListResponse.fromJson(json),
      responseStr: 'JobApplicationListResponse',
    );
    return paginatedCall(result: result);
  }

  ///Approve or reject employee
  Future<Result<dynamic>> approveRejectApplication({required ApproveRejectApplicationParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      url: params.isApprove ?  ApiURLs.approveWorkApplication : ApiURLs.rejectWorkApplication,
      method: HttpMethod.POST,
      withAuthentication: true,
      data: params.toJson(),
    );
    return noModelCall(result: result);
  }


  ///Delete Job
  Future<Result<dynamic>> deleteWorkApplication({required DeleteJobParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      url: ApiURLs.deleteWorkApplication,
      method: HttpMethod.DELETE,
      withAuthentication: true,
      queryParameters: params.toJson(),
    );
    return noModelCall(result: result);
  }


}