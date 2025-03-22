

import 'package:wazzifni_admin/core/common/models/profile_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../repository/user_repository.dart';


class GetUsersParams extends BaseParams {
  final GetListRequest request;

  GetUsersParams({
    required this.request,
  });


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());
    return queryParams;
  }
}


class GetUsersUseCase extends UseCase<List<UserProfileModel>, GetUsersParams> {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<Result<List<UserProfileModel>>> call({required GetUsersParams params}) {
    return repository.getAllUsers(params: params);
  }
}