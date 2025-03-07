


import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';

class EducationModel extends BaseModel{
  int? level;
  String? institutionName;
  String? fieldOfStudy;
  DateTime? startDate;
  DateTime? endDate;
  bool? isCurrentlyStudying;
  String? description;

  EducationModel({
    this.level,
    this.institutionName,
    this.fieldOfStudy,
    this.startDate,
    this.endDate,
    this.isCurrentlyStudying,
    this.description,
  });

  EducationModel.fromJson(Map<String, dynamic> json) {
    level = json['level'] as int?;
    institutionName = json['institutionName'] as String?;
    fieldOfStudy = json['fieldOfStudy'] as String?;
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    isCurrentlyStudying = json['isCurrentlyStudying'] as bool?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['level'] = level;
    json['institutionName'] = institutionName;
    json['fieldOfStudy'] = fieldOfStudy;
    json['startDate'] = startDate!.toIso8601String();
    json['endDate'] = endDate!.toIso8601String();
    json['isCurrentlyStudying'] = isCurrentlyStudying;
    json['description'] = description;
    return json;
  }
}