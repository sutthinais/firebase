import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/data/model/all/user_model.dart';
import 'package:getx_home_service/app/data/models/user.dart';
import 'package:getx_home_service/app/themes/app_theme.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_prefs.dart';

class SplashController extends GetxController {
  var isDarkMode = false.obs;
  var isChangeLanguage = false.obs;
  AppPreferences preferences = Get.find();
  void nextLoginPage() => Future.delayed(const Duration(seconds: 2), () => Get.toNamed(AppRoutes.login));
  void nextHomePage() => Future.delayed(const Duration(seconds: 2), () => Get.toNamed(AppRoutes.home));

  @override
  void onInit() async {
    await getLocalLanguage();
    await getTheme();
    checkUserIsLogin();
    super.onInit();
  }

  void checkUserIsLogin() async {
    try {
      bool user = await preferences.isUserLoggedIn();
      if (user) {
        String user = await preferences.getCashUserInfo();
        if (user == EMPTY) {
          nextLoginPage();
        } else {
          var userCache = await preferences.getCashUserInfo();
          Map<String, dynamic> data = json.decode(userCache);
          userInfo = UserInfo.fromJson(data);
          nextHomePage();
        }
      } else {
        nextLoginPage();
      }
    } catch (e) {
      nextLoginPage();
    }
  }

  Future getLocalLanguage() async {
    String language = await preferences.getLanguage();
    setLocalLanguage(language);

    if (language == 'th_TH') {
      isChangeLanguage(true);
      Get.updateLocale(Locale(language));
    } else {
      isChangeLanguage(false);
      Get.updateLocale(Locale(language));
    }
  }

  Future setLocalLanguage(String language) async {
    if (language == 'th_TH') {
      isChangeLanguage(true);
      Get.updateLocale(Locale(language));
    } else {
      isChangeLanguage(false);
      Get.updateLocale(Locale(language));
    }
    await preferences.setLanguage(language);
  }

  Future getTheme() async {
    String theme = await preferences.getTheme();
    setTheme(theme);
    if (theme == "light") {
      isDarkMode(true);
      Get.changeTheme(Themes.light);
    } else {
      isDarkMode(true);
      Get.changeTheme(Themes.dark);
    }
  }

  Future setTheme(String theme) async {
    await preferences.setTheme(theme);
  }

  void changeTheme() {
    isDarkMode.toggle();
    Get.changeTheme(isDarkMode.value ? Themes.dark : Themes.light);
    setTheme(isDarkMode.value ? 'light' : 'dark');
  }
}
