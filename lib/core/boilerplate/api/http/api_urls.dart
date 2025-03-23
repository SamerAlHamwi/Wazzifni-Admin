
import '../../../constants/app_settings.dart';

class ApiURLs {
  ///BASE_URL
  static String baseUrl = AppSettings.BASE_URL;

  ///User
  static String checkVersion = '$baseUrl/api/services/app/Configuration/HomeChecker';
  static String createUserProfile = '$baseUrl/api/services/app/Profile/Update';
  static String getUserProfile = '$baseUrl/api/services/app/Profile/Get';
  static String getAllUserProfile = '$baseUrl/api/services/app/Profile/GetAll';

  ///Auth
  static String login = '$baseUrl/api/TokenAuth/Authenticate';

  ///Cities
  static String allCities = '$baseUrl/api/services/app/City/GetAll';

  ///Languages
  static String allLanguages = '$baseUrl/api/services/app/SpokenLanguages/GetAll';

  ///Skills
  static String allSkills = '$baseUrl/api/services/app/Skill/GetAll';

  ///Company
  static String createCompanyAccount = '$baseUrl/api/services/app/Company/Create';
  static String updateCompanyAccount = '$baseUrl/api/services/app/Company/Update';
  static String getCompanyAccount = '$baseUrl/api/services/app/Company/Get';
  static String getAllCompany = '$baseUrl/api/services/app/Company/GetAll';
  static String approveCompany = '$baseUrl/api/services/app/Company/Approve';
  static String rejectCompany = '$baseUrl/api/services/app/Company/Reject';

  ///Attachment
  static String uploadAttachment = '$baseUrl/api/services/app/Attachment/Upload';


  ///WorkPost
  static String createWorkPost = '$baseUrl/api/services/app/WorkPost/Create';
  static String updateWorkPost = '$baseUrl/api/services/app/WorkPost/Update';
  static String getAllWorkPost = '$baseUrl/api/services/app/WorkPost/GetAll';
  static String getWorkPost = '$baseUrl/api/services/app/WorkPost/Get';
  static String deleteWorkPost = '$baseUrl/api/services/app/WorkPost/Delete';
  static String addRemoveFavWorkPost = '$baseUrl/api/services/app/WorkPost/AddOrRemoveFromMyFavourites';


  ///WorkApplication
  static String createWorkApplication = '$baseUrl/api/services/app/WorkApplication/Create';
  static String updateWorkApplication = '$baseUrl/api/services/app/WorkApplication/Update';
  static String getAllWorkApplication = '$baseUrl/api/services/app/WorkApplication/GetAll';
  static String getWorkApplication = '$baseUrl/api/services/app/WorkApplication/Get';
  static String deleteWorkApplication = '$baseUrl/api/services/app/WorkApplication/Delete';
  static String approveWorkApplication = '$baseUrl/api/services/app/WorkApplication/Approve';
  static String rejectWorkApplication = '$baseUrl/api/services/app/WorkApplication/Reject';


  ///Statistics
  static String getUserStatistics = '$baseUrl/api/services/app/Statistics/GetWorkApplicationStats';
  static String getCompanyStatistics = '$baseUrl/api/services/app/Statistics/GetWorkPostForCompanyStats';






}
