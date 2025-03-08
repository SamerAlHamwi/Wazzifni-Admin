



import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../use_case/add_job_use_case.dart';
import '../use_case/delete_work_post_use_case.dart';


class AddJobsRepository extends CoreRepository {

  ///AddJob & Update
  Future<Result<dynamic>> createWorkPost({required AddJobParams params}) async {
    print(params.toJson(),);
    final result = await RemoteDataSource.noModelRequest(
      url: params.isEdit! ? ApiURLs.updateWorkPost : ApiURLs.createWorkPost,
      method: params.isEdit! ? HttpMethod.PUT : HttpMethod.POST,
      withAuthentication: true,
      data: params.toJson(),
    );
    return noModelCall(result: result);
  }


  ///Delete Job
  Future<Result<dynamic>> deleteWorkPost({required DeleteJobParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      url: ApiURLs.deleteWorkPost,
      method: HttpMethod.DELETE,
      withAuthentication: true,
      queryParameters: params.toJson(),
    );
    return noModelCall(result: result);
  }


}