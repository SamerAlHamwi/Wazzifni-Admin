
import 'package:get_storage/get_storage.dart';
import '../../common/models/company_model.dart';
import '../../common/models/profile_model.dart';


class SharedStorage {

  static String storageName = 'wazzifni';
  static GetStorage box = GetStorage(storageName);
  static String tokenKey = 'tokenKey';
  static String userIdKey = 'userIdKey';
  static String userTypeKey = 'userTypeKey';
  static String companyIdKey = 'companyIdKey';
  static String profileIdKey = 'profileIdKey';
  static String userNameKey = 'userNameKey';
  static String companyNameKey = 'companyNameKey';
  static String companyKey = 'company';
  static String userKey = 'user';

  static init() async {
    await GetStorage.init(storageName);
  }


  static setToken(String token) {
    box.write(tokenKey, token);
  }

  static getToken() {
    return box.read(tokenKey) ?? '';
  }

  static hasToken() {
    if (getToken().isNotEmpty) {
      return true;
    }
    return false;
  }

  static setUserId(int userId) {
    box.write(userIdKey, userId);
  }

  static getUserId() {
    return box.read(userIdKey);
  }

  static setUserType(int userType) {
    box.write(userTypeKey, userType);
  }

  static getUserType() {
    return box.read(userTypeKey);
  }

  static setUserName(String userName) {
    box.write(userNameKey, userName);
  }

  static getUserName() {
    return box.read(userNameKey);
  }

  static setCompanyName(String companyName) {
    box.write(companyNameKey, companyName);
  }

  static getCompanyName() {
    return box.read(companyNameKey) ?? '';
  }

  static setProfileId(int profileId) {
    box.write(profileIdKey, profileId);
  }

  static getProfileId() {
    return box.read(profileIdKey);
  }

  static setCompanyId(int companyId) {
    box.write(companyIdKey, companyId);
  }

  static getCompanyId() {
    return box.read(companyIdKey);
  }

  static void setCompany(Company company) {
    box.write(companyKey, company.toJson());
  }

  static Company? getCompany() {
    Map<String, dynamic>? companyJson = box.read(companyKey);
    if (companyJson != null) {
      return Company.fromJson(companyJson);
    }
    return null;
  }

  static void setEmployee(UserProfileModel userProfileModel) {
    box.write(userKey, userProfileModel.toJson());
  }

  static UserProfileModel? getEmployee() {
    Map<String, dynamic>? userJson = box.read(userKey);
    if (userJson != null) {
      return UserProfileModel.fromJson(userJson);
    }
    return null;
  }


  static logout() async {
    await box.erase();
  }
}


