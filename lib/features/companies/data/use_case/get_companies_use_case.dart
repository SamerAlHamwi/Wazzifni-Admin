


import 'package:wazzifni_admin/core/common/models/company_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../repository/company_repository.dart';



class GetCompaniesParams extends BaseParams {
  final GetListRequest request;


  GetCompaniesParams({
    required this.request,
  });


  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());
    return queryParams;
  }
}


class GetCompaniesUseCase extends UseCase<List<Company>, GetCompaniesParams> {
  final CompanyRepository repository;

  GetCompaniesUseCase(this.repository);

  @override
  Future<Result<List<Company>>> call({required GetCompaniesParams params}) {
    return repository.getAllCompanies(params: params);
  }
}