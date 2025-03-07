



import 'package:wazzifni_admin/core/common/models/translations_model.dart';
import '../../boilerplate/api/data_source/model.dart';
import '../../boilerplate/responses/ApiResponse.dart';
import 'attachment_model.dart';
import 'cities_response.dart';
import 'user_model.dart';

class CompanyDetailsResponse extends ApiResponse<Company> {
  CompanyDetailsResponse({super.errors, required bool super.success, required super.data});
  factory CompanyDetailsResponse.fromJson(Map<String, dynamic> json) {
    return CompanyDetailsResponse(
        errors: json['error'],
        data: Company.fromJson(json['result']),
        success: json['success']
    );
  }
}


class Company extends BaseModel {
  int? id;
  String? name;
  String? about;
  String? address;
  List<Translations>? translations;
  CityModel? city;
  UserModel? user;
  bool? isActive;
  int? status;
  String? jobType;
  DateTime? dateOfEstablishment;
  String? reasonRefuse;
  int? numberOfEmployees;
  String? webSite;
  Attachments? profile;
  Attachments? companyProfile;
  List<Attachments>? attachments;
  String? creationTime;

  Company({
    this.id,
    this.name,
    this.about,
    this.address,
    this.translations,
    this.city,
    this.user,
    this.isActive,
    this.status,
    this.jobType,
    this.dateOfEstablishment,
    this.reasonRefuse,
    this.numberOfEmployees,
    this.profile,
    this.webSite,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    about = json['about'] as String?;
    address = json['address'] as String?;
    translations = (json['translations'] as List?)?.map((dynamic e) => Translations.fromJson(e as Map<String,dynamic>)).toList();
    city = (json['city'] as Map<String,dynamic>?) != null ? CityModel.fromJson(json['city'] as Map<String,dynamic>) : null;
    user = (json['user'] as Map<String,dynamic>?) != null ? UserModel.fromJson(json['user'] as Map<String,dynamic>) : null;
    isActive = json['isActive'] as bool?;
    status = json['status'] as int?;
    jobType = json['jobType'] as String?;
    dateOfEstablishment = json['dateOfEstablishment'] != null
        ? DateTime.tryParse(json['dateOfEstablishment'])
        : null;
    reasonRefuse = json['reasonRefuse'] as String?;
    numberOfEmployees = json['numberOfEmployees'] as int?;
    webSite = json['webSite'] as String?;
    profile = (json['profile'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['profile'] as Map<String,dynamic>) : null;
    companyProfile = (json['companyProfile'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['companyProfile'] as Map<String,dynamic>) : null;
    attachments = (json['attachments'] as List?)?.map((dynamic e) => Attachments.fromJson(e as Map<String,dynamic>)).toList();
    creationTime = json['creationTime'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['about'] = about;
    json['translations'] = translations?.map((e) => e.toJson()).toList();
    json['address'] = address;
    json['city'] = city?.toJson();
    json['user'] = user?.toJson();
    json['isActive'] = isActive;
    json['status'] = status;
    json['jobType'] = jobType;
    json['webSite'] = webSite;
    json['dateOfEstablishment'] = dateOfEstablishment?.toIso8601String();
    json['reasonRefuse'] = reasonRefuse;
    json['numberOfEmployees'] = numberOfEmployees;
    json['companyProfile'] = companyProfile?.toJson();
    json['attachments'] = attachments?.map((e) => e.toJson()).toList();
    json['profile'] = profile?.toJson();
    json['creationTime'] = creationTime;
    return json;
  }
}
