

import '../../../../../../core/boilerplate/responses/ApiResponse.dart';
import '../../boilerplate/api/data_source/model.dart';
import 'attachment_model.dart';


class LanguageListResponse extends ApiResponse<LanguageListModel> {
  LanguageListResponse({super.errors, required bool super.success, required super.data});
  factory LanguageListResponse.fromJson(Map<String, dynamic> json) {
    return LanguageListResponse(
        errors: json['error'],
        data: LanguageListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}


class LanguageListModel extends BaseModel {
  int? totalCount;
  List<LanguageModel>? items;

  LanguageListModel({
    this.totalCount,
    this.items,
  });

  LanguageListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => LanguageModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}


class LanguageModel extends BaseModel {
  String? name;
  String? displayName;
  Attachments? icon;
  int? id;
  int? oralLevel;
  int? writingLevel;
  bool? isNative;


  LanguageModel({
    this.name,
    this.displayName,
    this.icon,
    this.id,
    this.oralLevel = 1,
    this.writingLevel = 1,
    this.isNative,
  });

  LanguageModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    displayName = json['displayName'] as String?;
    icon = (json['icon'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['icon'] as Map<String,dynamic>) : null;
    id = json['id'] as int?;
    isNative = json['isNative'] ??  false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['displayName'] = displayName;
    json['icon'] = icon;
    json['spokenLanguageId'] = id;
    json['oralLevel'] = oralLevel;
    json['writingLevel'] = writingLevel;
    json['isNative'] = isNative;
    return json;
  }
}