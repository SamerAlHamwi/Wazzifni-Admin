


import 'package:wazzifni_admin/core/common/models/company_model.dart';
import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../repository/company_repository.dart';


class GetCompaniesParams extends BaseParams {
  final GetListRequest request;
  final int? cityId;
  final int? status;
  final String? keyword;


  GetCompaniesParams({
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


class GetCompaniesUseCase extends UseCase<List<Company>, GetCompaniesParams> {
  final CompanyRepository repository;

  GetCompaniesUseCase(this.repository);

  @override
  Future<Result<List<Company>>> call({required GetCompaniesParams params}) {
    return repository.getAllCompanies(params: params);
  }
}