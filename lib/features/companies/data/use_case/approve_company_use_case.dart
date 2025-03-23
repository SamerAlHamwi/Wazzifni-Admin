



import 'package:wazzifni_admin/features/companies/data/repository/company_repository.dart';

import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';


class ApproveCompanyParams extends BaseParams {

  ApproveCompanyParams({
    this.id,
  });

  final int? id;

  toJson() {
    Map<String, dynamic> queryParams = {};
    if (id != null) {
      queryParams.putIfAbsent("id", () => id);
    }
    return queryParams;
  }
}

class ApproveCompanyUseCase extends UseCase<dynamic, ApproveCompanyParams> {
  final CompanyRepository repository;

  ApproveCompanyUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required ApproveCompanyParams params}) {
    return repository.approveCompany(params: params);
  }
}
