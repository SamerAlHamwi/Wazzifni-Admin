



import '../../../../../core/boilerplate/api/data_source/remote_data_source.dart';
import '../../../../../core/boilerplate/api/http/api_urls.dart';
import '../../../../../core/boilerplate/api/http/http_method.dart';
import '../../../../../core/boilerplate/repository/core_repository.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../model/role_model.dart';
import '../use_case/get_roles_use_case.dart';


class RolesRepository extends CoreRepository {

  ///All roles
  Future<Result<List<RoleModel>>> getAllRoles({required GetRolesParams params}) async {
    final result = await RemoteDataSource.request(
      withAuthentication: true,
      url: ApiURLs.allRoles,
      method: HttpMethod.GET,
      queryParameters: params.toJson(),
      converter: (json) => RoleListResponse.fromJson(json),
      responseStr: 'RoleListResponse',
    );
    return paginatedCall(result: result);
  }


}