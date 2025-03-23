


import '../../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../../core/boilerplate/results/result.dart';
import '../../../../../../core/boilerplate/usecase/usecase.dart';
import '../../../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../../../../../core/common/models/job_model.dart';
import '../repository/job_repository.dart';

class GetJobsParams extends BaseParams {
  final GetListRequest request;
  final int? companyId;
  final String? keyword;
  final int? status;
  final int? timeFilter;
  final int? workEngagement;
  final int? workLevel;
  final int? workPlace;
  final int? cityId;
  final int? minExperience;
  final int? maxExperience;
  final int? experienceLevel;
  final double? minSalary;
  final double? maxSalary;
  final bool? isFavorite;
  final bool? isIApply;

  GetJobsParams({
    required this.request,
    this.companyId,
    this.keyword,
    this.status,
    this.timeFilter,
    this.workEngagement,
    this.workLevel,
    this.workPlace,
    this.cityId,
    this.minExperience,
    this.maxExperience,
    this.experienceLevel,
    this.minSalary,
    this.maxSalary,
    this.isFavorite,
    this.isIApply,
  });

  GetJobsParams copyWith({
    GetListRequest? request,
    int? companyId,
    String? keyword,
    int? status,
    int? timeFilter,
    int? workEngagement,
    int? workLevel,
    int? workPlace,
    int? cityId,
    int? minExperience,
    int? maxExperience,
    int? experienceLevel,
    double? minSalary,
    double? maxSalary,
    bool? isFavorite,
    bool? isIApply,
  }) {
    return GetJobsParams(
      request: request ?? this.request,
      companyId: companyId ?? this.companyId,
      keyword: keyword ?? this.keyword,
      status: status ?? this.status,
      timeFilter: timeFilter ?? this.timeFilter,
      workEngagement: workEngagement ?? this.workEngagement,
      workLevel: workLevel ?? this.workLevel,
      workPlace: workPlace ?? this.workPlace,
      cityId: cityId ?? this.cityId,
      minExperience: minExperience ?? this.minExperience,
      maxExperience: maxExperience ?? this.maxExperience,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
      isFavorite: isFavorite ?? this.isFavorite,
      isIApply: isIApply ?? this.isIApply,
    );
  }

  toJson() {
    Map<String, dynamic> queryParams = {};
    queryParams.addAll(request.toJson());
    if (companyId != null && companyId != -1) {
      queryParams.putIfAbsent("CompanyId", () => companyId);
    }
    if (cityId != null && cityId != -1) {
      queryParams.putIfAbsent("CityId", () => cityId);
    }
    if (keyword != null) {
      queryParams.putIfAbsent("Keyword", () => keyword);
    }
    if (status != null && status != -1) {
      queryParams.putIfAbsent("Status", () => status);
    }
    if (timeFilter != null && timeFilter != -1) {
      queryParams.putIfAbsent("TimeFilter", () => timeFilter);
    }
    if (workEngagement != null) {
      queryParams.putIfAbsent("WorkEngagement", () => workEngagement);
    }
    if (workLevel != null) {
      queryParams.putIfAbsent("WorkLevel", () => workLevel);
    }
    if (workPlace != null) {
      queryParams.putIfAbsent("WorkPlace", () => workPlace);
    }
    if (minExperience != null) {
      queryParams.putIfAbsent("MinExperience", () => minExperience);
    }
    if (maxExperience != null) {
      queryParams.putIfAbsent("MaxExperience", () => maxExperience);
    }
    if (minSalary != null) {
      queryParams.putIfAbsent("MinSalary", () => minSalary);
    }
    if (maxSalary != null) {
      queryParams.putIfAbsent("MaxSalary", () => maxSalary);
    }
    if (isFavorite != null) {
      queryParams.putIfAbsent("IsFavorite", () => isFavorite);
    }
    if (isIApply != null) {
      queryParams.putIfAbsent("IsIApply", () => isIApply);
    }

    return queryParams;
  }
}


class GetJobsListUseCase extends UseCase<List<JobModel>, GetJobsParams> {
  final JobsRepository repository;

  GetJobsListUseCase(this.repository);

  @override
  Future<Result<List<JobModel>>> call({required GetJobsParams params}) {
    return repository.getAllJobs2(params: params);
  }
}