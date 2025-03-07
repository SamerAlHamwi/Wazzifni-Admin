



import 'package:wazzifni_admin/core/boilerplate/api/data_source/model.dart';
import 'package:wazzifni_admin/core/common/models/attachment_model.dart';
import 'package:wazzifni_admin/core/common/models/skills_model.dart';
import 'package:wazzifni_admin/core/common/models/spoken_language_model.dart';
import 'package:wazzifni_admin/core/common/models/user_model.dart';
import 'package:wazzifni_admin/core/common/models/work_experiences_model.dart';
import '../../boilerplate/responses/ApiResponse.dart';
import 'award_model.dart';
import 'cities_response.dart';
import 'education_model.dart';

class UserProfileResponse extends ApiResponse<UserProfileModel> {
  UserProfileResponse({super.errors, required bool super.success, required super.data});
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
        errors: json['error'], data: UserProfileModel.fromJson(json['result']), success: json['success']);
  }
}


class UserProfileModel extends BaseModel {
  int? id;
  String? about;
  CityModel? city;
  UserModel? user;
  List<EducationModel>? educations;
  List<WorkExperiencesModel>? workExperiences;
  List<AwardModel>? awards;
  List<SpokenLanguages>? spokenLanguages;
  List<SkillModel>? skills;
  Attachments? image;
  Attachments? cv;


  UserProfileModel({
    this.id,
    this.about,
    this.city,
    this.user,
    this.educations,
    this.workExperiences,
    this.awards,
    this.spokenLanguages,
    this.skills,
    this.image,
    this.cv,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    about = json['about'] as String?;
    city = (json['city'] as Map<String,dynamic>?) != null ? CityModel.fromJson(json['city'] as Map<String,dynamic>) : null;
    user = (json['user'] as Map<String,dynamic>?) != null ? UserModel.fromJson(json['user'] as Map<String,dynamic>) : null;
    educations = (json['educations'] as List?)?.map((dynamic e) => EducationModel.fromJson(e as Map<String,dynamic>)).toList();
    workExperiences = (json['workExperiences'] as List?)?.map((dynamic e) => WorkExperiencesModel.fromJson(e as Map<String,dynamic>)).toList();
    awards = (json['awards'] as List?)?.map((dynamic e) => AwardModel.fromJson(e as Map<String,dynamic>)).toList();
    spokenLanguages = (json['spokenLanguages'] as List?)?.map((dynamic e) => SpokenLanguages.fromJson(e as Map<String,dynamic>)).toList();
    skills = (json['skills'] as List?)?.map((dynamic e) => SkillModel.fromJson(e as Map<String,dynamic>)).toList();
    image = (json['image'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['image'] as Map<String,dynamic>) : null;
    cv = (json['cv'] as Map<String,dynamic>?) != null ? Attachments.fromJson(json['cv'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['about'] = about;
    json['city'] = city?.toJson();
    json['user'] = user?.toJson();
    json['educations'] = educations?.map((e) => e.toJson()).toList();
    json['workExperiences'] = workExperiences?.map((e) => e.toJson()).toList();
    json['awards'] = awards?.map((e) => e.toJson()).toList();
    json['spokenLanguages'] = spokenLanguages?.map((e) => e.toJson()).toList();
    json['skills'] = skills?.map((e) => e.toJson()).toList();
    json['image'] = image?.toJson();
    json['cv'] = cv?.toJson();
    return json;
  }
}


