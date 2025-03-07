



import '../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/common/models/job_model.dart';


class GetJobParams extends BaseParams {

  final int? id;

  GetJobParams({required this.id});

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.putIfAbsent("Id", ()=> id);

    return queryParams;
  }
}

// class GetJobDetailsUseCase extends UseCase<JobModel, GetJobParams> {
//   final CompanyRepository repository;
//
//   GetJobDetailsUseCase(this.repository);
//
//   @override
//   Future<Result<JobModel>> call({required GetJobParams params}) {
//     return repository.getJobDetails(params: params);
//   }
// }