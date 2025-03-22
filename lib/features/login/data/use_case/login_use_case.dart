

import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../model/login_model.dart';
import '../repository/auth_repository.dart';

class LoginParams extends BaseParams {

  LoginParams({
    this.userNameOrEmailAddress,
    this.password,
  });

  final String? userNameOrEmailAddress;
  final String? password;

  toJson() {
    Map<String, dynamic> queryParams = {};
    if (userNameOrEmailAddress != null) {
      queryParams.putIfAbsent("userNameOrEmailAddress", () => userNameOrEmailAddress);
    }
    if (password != null) {
      queryParams.putIfAbsent("password", () => password);
    }
    queryParams.putIfAbsent("rememberClient", () => true);

    return queryParams;
  }
}

class LoginUseCase extends UseCase<LoginModel, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Result<LoginModel>> call({required LoginParams params}) {
    return repository.login(params: params);
  }
}
