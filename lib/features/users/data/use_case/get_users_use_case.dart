

import 'package:wazzifni_admin/core/common/models/profile_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../repository/user_repository.dart';


class GetUsersParams extends BaseParams {

  final GetListRequest request;
  final int? cityId;
  final int? status;
  final String? keyword;

  GetUsersParams({
    required this.request,
    this.cityId,
    this.status,
    this.keyword,
  });


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());

    if(cityId != null && cityId != -1){
      queryParams.putIfAbsent("CityId", ()=> cityId);
    }

    if(status != null && status != -1){
      queryParams.putIfAbsent("Status", ()=> status);
    }

    if(keyword != null && keyword!.isNotEmpty){
      queryParams.putIfAbsent("Keyword", ()=> keyword);
    }

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