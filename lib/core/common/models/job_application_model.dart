


import 'package:wazzifni_admin/core/common/models/attachment_model.dart';
import 'package:wazzifni_admin/core/common/models/profile_model.dart';
import '../../boilerplate/api/data_source/model.dart';
import '../../boilerplate/responses/ApiResponse.dart';
import 'job_model.dart';


class JobApplicationListResponse extends ApiResponse<JobApplicationListModel> {
  JobApplicationListResponse({super.errors, required bool super.success, required super.data});
  factory JobApplicationListResponse.fromJson(Map<String, dynamic> json) {
    return JobApplicationListResponse(
        errors: json['error'],
        data: JobApplicationListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}

class JobApplicationDetailsResponse extends ApiResponse<JobApplicationModel> {
  JobApplicationDetailsResponse({super.errors, required bool super.success, required super.data});
  factory JobApplicationDetailsResponse.fromJson(Map<String, dynamic> json) {
    return JobApplicationDetailsResponse(
        errors: json['error'],
        data: JobApplicationModel.fromJson(json['result']),
        success: json['success']
    );
  }
}

class JobApplicationListModel extends BaseModel {
  int? totalCount;
  List<JobApplicationModel>? items;

  JobApplicationListModel({
    this.totalCount,
    this.items,
  });

  JobApplicationListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => JobApplicationModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class JobApplicationModel extends BaseModel {
  int? id;
  JobModel? workPost;
  int? status;
  String? description;
  UserProfileModel? profile;
  String? rejectReason;
  DateTime? creationTime;
  Attachments? image;

  JobApplicationModel({
    this.id,
    this.workPost,
    this.status,
    this.description,
    this.profile,
    this.rejectReason,
    this.image,
    this.creationTime,
  });

  JobApplicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    workPost = (json['workPost'] as Map<String,dynamic>?) != null ? JobModel.fromJson(json['workPost'] as Map<String,dynamic>) : null;
    status = json['status'] as int?;
    description = json['description'] as String?;
    profile = (json['profile'] as Map<String,dynamic>?) != null ? UserProfileModel.fromJson(json['profile'] as Map<String,dynamic>) : null;
    image = (json['image'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['image'] as Map<String,dynamic>) : null;
    rejectReason = json['rejectReason'] as String?;
    creationTime = DateTime.tryParse(json['creationTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['workPost'] = workPost?.toJson();
    json['image'] = image?.toJson();
    json['status'] = status;
    json['description'] = description;
    json['profile'] = profile?.toJson();
    json['rejectReason'] = rejectReason;
    json['creationTime'] = creationTime;
    return json;
  }
}




