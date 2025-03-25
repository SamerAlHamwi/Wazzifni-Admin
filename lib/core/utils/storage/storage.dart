
import 'package:get_storage/get_storage.dart';
import '../../common/models/cities_response.dart';
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
  static String citiesKey = 'citiesKey';
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

  static void setCities(CityListModel cityListModel) {
    box.write(citiesKey, cityListModel.toJson());
  }

  static CityListModel? getCities() {
    Map<String, dynamic>? citiesJson = box.read(citiesKey);
    if (citiesJson != null) {
      return CityListModel.fromJson(citiesJson);
    }
    return null;
  }


  static logout() async {
    await box.erase();
  }
}


