



import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/common/models/profile_model.dart';
import '../../../jobs/data/use_case/get_job_use_case.dart';


class UserRepository extends CoreRepository {


  ///User details
  Future<Result<UserProfileModel>> getUserProfile({required GetJobParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.getUserProfile,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => UserProfileResponse.fromJson(json),
      responseStr: 'UserProfileResponse',
    );
    return call(result: result);
  }


}