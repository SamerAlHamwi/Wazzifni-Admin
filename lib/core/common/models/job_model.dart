


import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';
import '../../../../../../core/boilerplate/responses/ApiResponse.dart';
import 'company_model.dart';

class JobsListResponse extends ApiResponse<JobsListModel> {
  JobsListResponse({super.errors, required bool super.success, required super.data});
  factory JobsListResponse.fromJson(Map<String, dynamic> json) {
    return JobsListResponse(
        errors: json['error'],
        data: JobsListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}

class JobsDetailsResponse extends ApiResponse<JobModel> {
  JobsDetailsResponse({super.errors, required bool super.success, required super.data});
  factory JobsDetailsResponse.fromJson(Map<String, dynamic> json) {
    return JobsDetailsResponse(
        errors: json['error'],
        data: JobModel.fromJson(json['result']),
        success: json['success']
    );
  }
}

class JobsListModel extends BaseModel {
  int? totalCount;
  List<JobModel>? items;

  JobsListModel({
    this.totalCount,
    this.items,
  });

  JobsListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => JobModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}


class JobModel extends BaseModel {
  int? id;
  int? companyId;
  Company? company;
  int? status;
  String? title;
  String? description;
  int? workEngagement;
  int? workLevel;
  int? workPlace;
  int? educationLevel;
  double? minSalary;
  double? maxSalary;
  int? experienceYearsCount;
  int? requiredEmployeesCount;
  int? applicantsCount;
  int? workAvailbility;
  bool? isFavorite;
  bool? isIApply;
  String? slug;
  DateTime? creationTime;

  JobModel({
    this.id,
    this.companyId,
    this.company,
    this.status,
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
    this.applicantsCount,
    this.workAvailbility,
    this.isFavorite,
    this.isIApply,
    this.slug,
    this.creationTime,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    companyId = json['companyId'] as int?;
    company = (json['company'] as Map<String,dynamic>?) != null ? Company.fromJson(json['company'] as Map<String,dynamic>) : null;
    status = json['status'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    workEngagement = json['workEngagement'] as int?;
    workLevel = json['workLevel'] as int?;
    workPlace = json['workPlace'] as int?;
    educationLevel = json['educationLevel'] as int?;
    minSalary = json['minSalary'] as double?;
    maxSalary = json['maxSalary'] as double?;
    experienceYearsCount = json['experienceYearsCount'] as int?;
    requiredEmployeesCount = json['requiredEmployeesCount'] as int?;
    applicantsCount = json['applicantsCount'] as int?;
    workAvailbility = json['workAvailbility'] as int?;
    isFavorite = json['isFavorite'] ?? false;
    isIApply = json['isIApply'] as bool?;
    slug = json['slug'] as String?;
    creationTime = DateTime.tryParse(json['creationTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['companyId'] = companyId;
    json['company'] = company?.toJson();
    json['status'] = status;
    json['title'] = title;
    json['description'] = description;
    json['workEngagement'] = workEngagement;
    json['workLevel'] = workLevel;
    json['educationLevel'] = educationLevel;
    json['minSalary'] = minSalary;
    json['maxSalary'] = maxSalary;
    json['experienceYearsCount'] = experienceYearsCount;
    json['requiredEmployeesCount'] = requiredEmployeesCount;
    json['applicantsCount'] = applicantsCount;
    json['workVisibility'] = workAvailbility;
    return json;
  }
}


