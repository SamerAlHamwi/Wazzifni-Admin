

import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';

class AwardModel extends BaseModel{
  String? name;
  String? category;
  DateTime? date;
  String? description;

  AwardModel({
    this.name,
    this.category,
    this.date,
    this.description,
  });

  AwardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    category = json['category'] as String?;
    date = DateTime.parse(json['date']);
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['category'] = category;
    json['date'] = date!.toIso8601String();
    json['description'] = description;
    return json;
  }
}