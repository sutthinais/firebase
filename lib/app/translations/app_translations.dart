// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_us.dart';
import 'th_th.dart';

class AppTranslationKey {
  AppTranslationKey._();

  // API Error
  static String get unknownError => "unknownError".tr;
  static String get timeoutError => "timeoutError".tr;
  static String get noConnectionError => "noConnectionError".tr;
  static String get unauthorizedError => "unauthorizedError".tr;
  static String get tryAgain => "tryAgain".tr;
  static String get identify => "identify".tr;
  static String get error => "error".tr;
  static String get successful => "successful".tr;
  static String get notMatch => "notMatch".tr;
  static String get noEmpty => "noEmpty".tr;
  static String get noRecords => "noRecords".tr;
  static String get pleaseLogin => "pleaseLogin".tr;
  static String get noData => "noData".tr;
  static String get enterText => "enterText".tr;
  static String get noInternetError => "noInternetError".tr;
  static String get versionIsNotValid => "versionIsNotValid".tr;

  static String get TEXT_EMPTY => "";
  static String get TEXT_ZERO => "0";
  static String get APP_VERSION => "0.0.1";
  static String get APP_NAME_TH => "โฮมวันเซอร์วิส";
  static String get APP_NAME_EN => "HOMEONE SERVICE";

  static String get TEXT_LOGIN => "TEXT_LOGIN".tr;
  static String get TEXT_DEFUALT_ERROR => "TEXT_DEFUALT_ERROR".tr;
  static String get APP_VERSION_NAME => "APP_VERSION_NAME".tr;
  static String get TEXT_USER_NAME => "TEXT_USER_NAME".tr;
  static String get TEXT_PASSWORD => "TEXT_PASSWORD".tr;
  static String get TEXT_SEARCH_NAME_AND_PHONE_NUMBER_CUSTOMER => "TEXT_SEARCH_NAME_AND_PHONE_NUMBER_CUSTOMER".tr;

  // Drawer Menu Text
  static String get TEXT_SETTING => "TEXT_SETTING".tr;
  static String get TEXT_TRACKING_STATUS => "TEXT_TRACKING_STATUS".tr;
  static String get TEXT_DOWNLOAD_REPORTS => "TEXT_DOWNLOAD_REPORTS".tr;
  static String get TEXT_SUMMARY_ALL_PAYMENT => "TEXT_SUMMARY_ALL_PAYMENT".tr;
  static String get TEXT_LOGOUT => "TEXT_LOGOUT".tr;

  // Setting page
  static String get TEXT_CHNANGE_LANGUAGE => "TEXT_CHNANGE_LANGUAGE".tr;
  static String get TEXT_THAI => "TEXT_THAI".tr;
  static String get TEXT_ENGLISH => "TEXT_ENGLISH".tr;
  static String get TEXT_LIGHT => "TEXT_LIGHT".tr;
  static String get TEXT_DARK => "TEXT_DARK".tr;
  static String get TEXT_THEME => "TEXT_THEME".tr;
  static String get TEXT_PROFILE_STATUS => "TEXT_PROFILE_STATUS".tr;
  static String get TEXT_LOADING => "TEXT_LOADING".tr;
  static String get TEXT_OK => "TEXT_OK".tr;
  static String get TEXT_CANCEL => "TEXT_CANCEL".tr;
  static String get USERNAME_AND_PASSWORD_IS_VALID => "USERNAME_AND_PASSWORD_IS_VALID".tr;
  static String get NOT_USE_APP_TIMEOUT => "NOT_USE_APP_TIMEOUT".tr;
  static String get TEXT_EDIT_PROFILE => "TEXT_EDIT_PROFILE".tr;
}

class AppTranslation {
  AppTranslation._();

  static final Locale locale = Get.deviceLocale!;
  static final Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'th_TH': thTH,
  };
}
