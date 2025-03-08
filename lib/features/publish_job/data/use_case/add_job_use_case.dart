

import '../../../../../core/boilerplate/params/base_params.dart';
import '../../../../../core/boilerplate/results/result.dart';
import '../../../../../core/boilerplate/usecase/usecase.dart';
import '../repository/add_job_repository.dart';


class AddJobParams extends BaseParams {
  int? id;
  int? companyId;
  String? title;
  String? description;
  int? workEngagement;
  int? workLevel;
  int? workPlace;
  int? educationLevel;
  int? minSalary;
  int? maxSalary;
  int? experienceYearsCount;
  int? requiredEmployeesCount;
  bool? isEdit;

  AddJobParams({
    this.id,
    this.companyId,
    this.title,
    this.description,
    this.workEngagement,
    this.workLevel,
    this.workPlace,
    this.educationLevel,
    this.minSalary,
    this.maxSalary,
    this.experienceYearsCount,
    this.requiredEmployeesCount,
    this.isEdit = false,
  });

  AddJobParams.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    companyId = json['companyId'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    workEngagement = json['workEngagement'] as int?;
    workLevel = json['workLevel'] as int?;
    workPlace = json['workPlace'] as int?;
    educationLevel = json['educationLevel'] as int?;
    minSalary = json['minSalary'] as int?;
    maxSalary = json['maxSalary'] as int?;
    experienceYearsCount = json['experienceYearsCount'] as int?;
    requiredEmployeesCount = json['requiredEmployeesCount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if(id != null){
      json['id'] = id;
    }
    if(companyId != null){
      json['companyId'] = id;
    }
    json['title'] = title;
    json['description'] = description;
    json['workEngagement'] = workEngagement;
    json['workLevel'] = workLevel;
    json['workPlace'] = workPlace;
    json['educationLevel'] = educationLevel;
    json['minSalary'] = minSalary;
    json['maxSalary'] = maxSalary;
    json['experienceYearsCount'] = experienceYearsCount;
    json['requiredEmployeesCount'] = requiredEmployeesCount;
    return json;
  }

  AddJobParams copyWith({
    int? id,
    int? companyId,
    String? title,
    String? description,
    int? workEngagement,
    int? workLevel,
    int? workPlace,
    int? educationLevel,
    int? minSalary,
    int? maxSalary,
    int? experienceYearsCount,
    int? requiredEmployeesCount,
    bool? isEdit
  }) {
    return AddJobParams(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      title: title ?? this.title,
      description: description ?? this.description,
      workEngagement: workEngagement ?? this.workEngagement,
      workLevel: workLevel ?? this.workLevel,
      workPlace: workPlace ?? this.workPlace,
      educationLevel: educationLevel ?? this.educationLevel,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
      experienceYearsCount: experienceYearsCount ?? this.experienceYearsCount,
      requiredEmployeesCount: requiredEmployeesCount ?? this.requiredEmployeesCount,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}


class CreateJobUseCase extends UseCase<dynamic, AddJobParams> {
  final AddJobsRepository repository;

  CreateJobUseCase(this.repository);

  @override
  Future<Result<dynamic>> call({required AddJobParams params}) {
    return repository.createWorkPost(params: params);
  }
}

