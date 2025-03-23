


import 'package:wazzifni_admin/features/companies/data/repository/company_repository.dart';

import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';


class RejectCompanyParams extends BaseParams {

  RejectCompanyParams({
    this.companyId,
    this.reasonRefuse,
  });

  final int? companyId;
  final String? reasonRefuse;

  toJson() {
    Map<String, dynamic> queryParams = {};
    if (companyId != null) {
      queryParams.putIfAbsent("companyId", () => companyId);
    }
    if (reasonRefuse != null) {
      queryParams.putIfAbsent("reasonRefuse", () => reasonRefuse);
    }
    return queryParams;
  }
}

class RejectCompanyUseCase extends UseCase<dynamic, RejectCompanyParams> {
  final CompanyRepository repository;

  RejectCompanyUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required RejectCompanyParams params}) {
    return repository.rejectCompany(params: params);
  }
}
