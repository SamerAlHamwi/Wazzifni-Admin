


import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';
import '../../../../../../core/boilerplate/responses/ApiResponse.dart';
import '../../../../../../core/common/models/translations_model.dart';

class SkillsListResponse extends ApiResponse<SkillsListModel> {
  SkillsListResponse({super.errors, required bool super.success, required super.data});
  factory SkillsListResponse.fromJson(Map<String, dynamic> json) {
    return SkillsListResponse(
        errors: json['error'],
        data: SkillsListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}


class SkillsListModel extends BaseModel {
  int? totalCount;
  List<SkillModel>? items;

  SkillsListModel({
    this.totalCount,
    this.items,
  });

  SkillsListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => SkillModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class SkillModel extends BaseModel {
  List<Translations>? translations;
  String? name;
  bool? isActive;
  int? id;

  SkillModel({
    this.translations,
    this.name,
    this.isActive,
    this.id,
  });

  SkillModel.fromJson(Map<String, dynamic> json) {
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    name = json['name'] as String?;
    isActive = json['isActive'] as bool?;
    id = json['id'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['name'] = name;
    json['isActive'] = isActive;
    json['id'] = id;
    return json;
  }
}

