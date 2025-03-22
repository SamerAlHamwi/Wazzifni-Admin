

import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/common/models/job_application_model.dart';
import '../repository/job_application_repository.dart';



class GetApplicationJobsParams extends BaseParams {

  final GetListRequest request;
  final int? companyId;
  final int? profileId;
  final String? keyword;
  final int? status;
  final bool? deletedByCompany;
  final int? workPostId;

  GetApplicationJobsParams({
    required this.request,
    this.companyId,
    this.profileId,
    this.keyword,
    this.status,
    this.deletedByCompany,
    this.workPostId,
  });

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());
    if(companyId != null){
      queryParams.putIfAbsent("CompanyId", ()=> companyId);
    }
    if(profileId != null){
      queryParams.putIfAbsent("ProfileId", ()=> profileId);
    }
    if(keyword != null){
      queryParams.putIfAbsent("Keyword", ()=> keyword);
    }
    if(status != null){
      queryParams.putIfAbsent("Status", ()=> status);
    }
    if(deletedByCompany != null){
      queryParams.putIfAbsent("DeletedByCompany", ()=> deletedByCompany);
    }
    if(workPostId != null){
      queryParams.putIfAbsent("WorkPostId", ()=> workPostId);
    }

    return queryParams;
  }
}

class GetApplicationsUseCase extends UseCase<JobApplicationListModel, GetApplicationJobsParams> {
  final JobApplicationRepository repository;

  GetApplicationsUseCase(this.repository);

  @override
  Future<Result<JobApplicationListModel>> call({required GetApplicationJobsParams params}) {
    return repository.getAllApplications(params: params);
  }
}

class GetApplicationJobsListUseCase extends UseCase<List<JobApplicationModel>, GetApplicationJobsParams> {
  final JobApplicationRepository repository;

  GetApplicationJobsListUseCase(this.repository);

  @override
  Future<Result<List<JobApplicationModel>>> call({required GetApplicationJobsParams params}) {
    return repository.getAllApplicationJob(params: params);
  }
}
