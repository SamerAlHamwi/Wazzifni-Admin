


import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';

import '../../../../../../core/boilerplate/responses/ApiResponse.dart';
import '../../../../../../core/common/models/translations_model.dart';


class CityListResponse extends ApiResponse<CityListModel> {
  CityListResponse({super.errors, required bool super.success, required super.data});
  factory CityListResponse.fromJson(Map<String, dynamic> json) {
    return CityListResponse(
        errors: json['error'],
        data: CityListModel.fromJson(json['result']),
        success: json['success']
    );
  }
}

class CityListModel extends BaseModel {
  int? totalCount;
  List<CityModel>? items;

  CityListModel({
    this.totalCount,
    this.items,
  });

  CityListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] as int?;
    items = (json['items'] as List?)?.map((dynamic e) => CityModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalCount'] = totalCount;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class CityModel extends BaseModel {
  List<Translations>? translations;
  String? name;
  int? countryId;
  bool? isActive;
  Country? country;
  List<dynamic>? regions;
  dynamic attachment;
  int? id;

  CityModel({
    this.translations,
    this.name,
    this.countryId,
    this.isActive,
    this.country,
    this.regions,
    this.attachment,
    this.id,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    name = json['name'] as String?;
    countryId = json['countryId'] as int?;
    isActive = json['isActive'] as bool?;
    country = (json['country'] as Map<String,dynamic>?) != null ? Country.fromJson(json['country'] as Map<String,dynamic>) : null;
    regions = json['regions'] as List?;
    attachment = json['attachment'];
    id = json['id'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['name'] = name;
    json['countryId'] = countryId;
    json['isActive'] = isActive;
    json['country'] = country?.toJson();
    json['regions'] = regions;
    json['attachment'] = attachment;
    json['id'] = id;
    return json;
  }
}

class Country extends BaseModel {
  String? name;
  bool? isActive;
  String? dialCode;
  List<Translations>? translations;
  int? id;

  Country({
    this.name,
    this.isActive,
    this.dialCode,
    this.translations,
    this.id,
  });

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    isActive = json['isActive'] as bool?;
    dialCode = json['dialCode'] as String?;
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    id = json['id'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['isActive'] = isActive;
    json['dialCode'] = dialCode;
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['id'] = id;
    return json;
  }
}

