

import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/common/models/company_model.dart';
import '../../../jobs/data/use_case/get_job_use_case.dart';
import '../repository/company_repository.dart';



class GetCompanyDetailsUseCase extends UseCase<Company, GetJobParams> {
  final CompanyRepository repository;

  GetCompanyDetailsUseCase(this.repository);

  @override
  Future<Result<Company>> call({required GetJobParams params}) {
    return repository.getCompanyDetails(params: params);
  }
}