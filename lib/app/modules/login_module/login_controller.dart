// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_home_service/app/data/models/user.dart';
import 'package:getx_home_service/app/routes/app_pages.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';
import 'package:getx_home_service/app/utils/widgets/dialog2.dart';

import '../../data/model/request/request.dart';
import '../../data/services/repository.dart';
import '../../utils/functions.dart';
import '../base_module/base_module.dart';

class LoginController extends GetxController {
  final Repository _repository = Get.find();
  final AppPreferences _preferences = Get.find();
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();

  final _state = Rx<EventState>(EventState.SUCCESS_STATE);
  Rx<EventState> get state => _state;

  RxBool showPassword = T.obs;
  @override
  void onInit() {
    super.onInit();
  }

  isShowPassword() => showPassword.trigger(!showPassword.value);

  nextPageHomeScreen() => Get.offAllNamed(AppRoutes.home);

  Future login() async {
    if (userid.text.isEmpty || password.text.isEmpty) {
      Get.dialog(
        ErrorDialog(
          message: AppTranslationKey.USERNAME_AND_PASSWORD_IS_VALID,
          ok: () {
            Get.back();
          },
          content: Container(),
        ),
      );
      return;
    }
    var loginRequest = LoginRequest(userid: userid.text, password: password.text, name: "name", db: "0", deviceInfo: await getDeviceDetails());
    _state(EventState.LOADING_STATE);
    (await _repository.isLoggedIn(loginRequest: loginRequest)).fold((l) {
      _state(EventState.SUCCESS_STATE);
      Get.dialog(
        ErrorDialog(
          message: l.message,
          ok: () {
            Get.back();
          },
          content: Container(),
        ),
      );
    }, (r) {
      _state.value = EventState.SUCCESS_STATE;
      userInfo = r;
      _preferences.setIsUserLoggedIn();
      _preferences.setCashUserInfo(json.encode(r.toJson()));
      nextPageHomeScreen();
    });
  }
}
