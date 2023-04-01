import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';

import '../../themes/app_theme.dart';

class SettingController extends GetxController {
  final AppPreferences preferences;
  SettingController(this.preferences);

  RxBool isChangeLanguage = false.obs;
  RxBool isDarkMode = false.obs;

  @override
  void onInit() async {
    await getLocalLanguage();
    await getTheme();
    super.onInit();
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

    if (theme == "light") {
      Get.changeTheme(Themes.light);
      isDarkMode(true);
    } else {
      isDarkMode(false);
      Get.changeTheme(Themes.dark);
    }
    setTheme(theme);
  }

  Future setTheme(String theme) async {
    await preferences.setTheme(theme);
  }

  void changeTheme(bool theme) {
    // isDarkMode.toggle();
    Get.changeTheme(theme ? Themes.light : Themes.dark);
    isDarkMode(theme);
    setTheme(theme ? 'light' : 'dark');
  }
}
