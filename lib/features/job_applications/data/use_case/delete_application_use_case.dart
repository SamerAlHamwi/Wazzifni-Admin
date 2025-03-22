


import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../publish_job/data/use_case/delete_work_post_use_case.dart';
import '../repository/job_application_repository.dart';


class DeleteApplicationUseCase extends UseCase<dynamic, DeleteJobParams> {
  final JobApplicationRepository repository;

  DeleteApplicationUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required DeleteJobParams params}) {
    return repository.deleteWorkApplication(params: params);
  }
}




