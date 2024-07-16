import 'package:shared_preferences/shared_preferences.dart';

class HelperService {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String isPremiumUser = "ISPREMIUMUSER";
  static String adminLoggedInKey = "ISADMINLOGGEDIN";
  static String isSurveyFilledKey = "ISSURVEYFILLED";
  static String userIDKey = "UID";

  // saving the data to SF
  static Future<bool> saveSurveyStatus(bool isSurveyFilled) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(isSurveyFilledKey, isSurveyFilled);
  }

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveAdminLoggedInStatus(bool isAdminLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(adminLoggedInKey, isAdminLoggedIn);
  }

  static Future<bool> saveIsPremiumUser(bool isPremium) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(isPremiumUser, isPremium);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserID(String uid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userIDKey, uid);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<bool?> getSurveyStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(isSurveyFilledKey);
  }

  static Future<bool?> getAdminLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(adminLoggedInKey);
  }

  static Future<bool?> getIsPremiumUser() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(isPremiumUser);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserID() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userIDKey);
  }
}
