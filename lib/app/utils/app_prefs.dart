// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:getx_home_service/app/utils/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_PRIVATE_TOKEN = "PREFS_KEY_PRIVATE_TOKEN";
const String PREFS_KEY_BRANCHCODE = "PREFS_KEY_BRANCHCODE";
const String PREFS_KEY_APP_VERSION = "PREFS_KEY_APP_VERSION";
const String PREFS_KEY_APP_THEME = "PREFS_KEY_APP_THEME";
const String CACHE_USER_INFO = "CACHE_USER_INFO";
const String EMPTY = "";

class AppPreferences {
  SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getLanguage() async {
    return _sharedPreferences.getString(PREFS_KEY_LANG) ?? "th_TH";
  }

  Future<void> setLanguage(String language) async {
    _sharedPreferences.setString(PREFS_KEY_LANG, language);
  }

  Future<String> getTheme() async {
    return _sharedPreferences.getString(PREFS_KEY_APP_THEME) ?? "light";
  }

  Future setTheme(String theme) async {
    _sharedPreferences.setString(PREFS_KEY_APP_THEME, theme);
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<void> setUserPrivateToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_PRIVATE_TOKEN, token);
  }

  Future<void> setBranchCode(String branchCode) async {
    _sharedPreferences.setString(PREFS_KEY_BRANCHCODE, branchCode);
  }

  Future<String> getBranchCode() async {
    return _sharedPreferences.getString(PREFS_KEY_BRANCHCODE) ?? "";
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  Future<String> getUserPrivateToken() async {
    return _sharedPreferences.getString(PREFS_KEY_PRIVATE_TOKEN) ?? "";
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  // ?? BEGIN SET AND GET VERSION APP??
  Future<void> setIsAppVersion(String version) async {
    _sharedPreferences.setString(PREFS_KEY_APP_VERSION, version);
  }

  // ?? BEGIN REMOVE VERSION APP??
  Future<void> removeIsAppVersion() async {
    _sharedPreferences.remove(PREFS_KEY_APP_VERSION);
  }

  Future<String?> getIsAppVersion() async {
    return _sharedPreferences.getString(PREFS_KEY_APP_VERSION);
  }

  // ?? USER LOGIN
  Future<bool> isUserLoggedIn() async {
    "USERINFO LOGIN".logStr();
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future setCashUserInfo(String cacheUserInfo) async {
    "CACHED USERINFO".logStr();
    return _sharedPreferences.setString(CACHE_USER_INFO, cacheUserInfo);
  }

  Future<String> getCashUserInfo() async {
    "GET USERINFO LOGIN".logStr();
    return _sharedPreferences.getString(CACHE_USER_INFO) ?? EMPTY;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_PRIVATE_TOKEN);
    _sharedPreferences.remove(PREFS_KEY_TOKEN);
    _sharedPreferences.remove(PREFS_KEY_BRANCHCODE);
    _sharedPreferences.remove(CACHE_USER_INFO);
    // _sharedPreferences.remove(PREFS_KEY_APP_VERSION);
  }
}
