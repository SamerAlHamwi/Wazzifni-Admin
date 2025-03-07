

import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/common/models/profile_model.dart';
import '../../../jobs/data/use_case/get_job_use_case.dart';
import '../repository/user_repository.dart';



class GetUserProfileUseCase extends UseCase<UserProfileModel, GetJobParams> {
  final UserRepository repository;

  GetUserProfileUseCase(this.repository);

  @override
  Future<Result<UserProfileModel>> call({required GetJobParams params}) {
    return repository.getUserProfile(params: params);
  }
}