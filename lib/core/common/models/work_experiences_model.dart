

import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';

class WorkExperiencesModel extends BaseModel {
  String? jobTitle;
  String? companyName;
  DateTime? startDate;
  DateTime? endDate;
  bool? isCurrentJob;
  String? description;

  WorkExperiencesModel({
    this.jobTitle,
    this.companyName,
    this.startDate,
    this.endDate,
    this.isCurrentJob,
    this.description,
  });

  WorkExperiencesModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'] as String?;
    companyName = json['companyName'] as String?;
    startDate = json['startDate'] != null ? DateTime.parse(json['startDate']) : null;
    endDate = json['endDate'] != null ? DateTime.parse(json['endDate']) : null;
    isCurrentJob = json['isCurrentJob'] as bool?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if(jobTitle != null){
      json['jobTitle'] = jobTitle;
    }
    if(companyName != null){
      json['companyName'] = companyName;
    }
    if(startDate != null){
      json['startDate'] = startDate!.toIso8601String();
    }
    if(endDate != null){
      json['endDate'] = endDate!.toIso8601String();
    }
    if(isCurrentJob != null){
      json['isCurrentJob'] = isCurrentJob;
    }
    if(description != null){
      json['description'] = description;
    }
    return json;
  }
}