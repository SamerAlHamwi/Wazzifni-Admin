


import 'package:wazzifni_admin/core/common/models/profile_model.dart';
import 'package:wazzifni_admin/features/roles/data/repository/roles_repository.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../model/role_model.dart';


class GetRolesParams extends BaseParams {

  final GetListRequest request;
  final String? keyword;

  GetRolesParams({
    required this.request,
    this.keyword,
  });


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());

    if(keyword != null && keyword!.isNotEmpty){
      queryParams.putIfAbsent("Keyword", ()=> keyword);
    }

    return queryParams;
  }
}


class GetRolesUseCase extends UseCase<List<RoleModel>, GetRolesParams> {
  final RolesRepository repository;

  GetRolesUseCase(this.repository);

  @override
  Future<Result<List<RoleModel>>> call({required GetRolesParams params}) {
    return repository.getAllRoles(params: params);
  }
}