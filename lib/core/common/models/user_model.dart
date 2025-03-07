



import '../../boilerplate/api/data_source/model.dart';

class UserModel extends BaseModel {
  int? id;
  String? userName;
  String? name;
  String? surname;
  bool? isActive;
  String? fullName;
  String? registrationFullName;
  String? dialCode;
  String? phoneNumber;
  int? type;

  UserModel({
    this.id,
    this.userName,
    this.name,
    this.surname,
    this.isActive,
    this.fullName,
    this.registrationFullName,
    this.dialCode,
    this.phoneNumber,
    this.type,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userName = json['userName'] as String?;
    name = json['name'] as String?;
    surname = json['surname'] as String?;
    isActive = json['isActive'] as bool?;
    fullName = json['fullName'] as String?;
    dialCode = json['dialCode'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    registrationFullName = json['registrationFullName'] as String?;
    type = json['type'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['userName'] = userName;
    json['name'] = name;
    json['surname'] = surname;
    json['isActive'] = isActive;
    json['fullName'] = fullName;
    json['registrationFullName'] = registrationFullName;
    json['dialCode'] = dialCode;
    json['phoneNumber'] = phoneNumber;
    json['type'] = type;
    return json;
  }
}