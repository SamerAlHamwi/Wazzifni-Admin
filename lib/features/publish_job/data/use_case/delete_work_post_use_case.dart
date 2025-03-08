


import '../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../repository/add_job_repository.dart';


class DeleteJobParams extends BaseParams {

  final int id;

  DeleteJobParams({required this.id});

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("Id", ()=> id);

    return queryParams;
  }
}


class DeleteJobUseCase extends UseCase<dynamic, DeleteJobParams> {
  final AddJobsRepository repository;

  DeleteJobUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required DeleteJobParams params}) {
    return repository.deleteWorkPost(params: params);
  }
}



