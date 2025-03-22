


import '../../../../core/boilerplate/api/data_source/model.dart';
import '../../../../core/boilerplate/responses/ApiResponse.dart';



class LoginResponse extends ApiResponse<LoginModel> {
  LoginResponse({super.errors, required bool super.success, required super.data});
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        errors: json['error'], data: LoginModel.fromJson(json['result']), success: json['success']);
  }
}


class LoginModel extends BaseModel {
  String? accessToken;
  int? userId;
  String? userName;
  int? userType;


  LoginModel({
    this.accessToken,
    this.userId,
    this.userName,
    this.userType,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] as String?;
    userId = json['userId'] as int?;
    userName = json['userName'] as String?;
    userType = json['userType'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['accessToken'] = accessToken;
    json['userId'] = userId;
    json['userName'] = userName;
    json['userType'] = userType;
    return json;
  }
}
