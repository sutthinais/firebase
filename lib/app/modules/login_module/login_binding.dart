// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/login_module/login_controller.dart';

import '../app_module/app_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(LoginController());
    final AppController _appcontroller = Get.find();
    if (_appcontroller.seconds.value == _appcontroller.maxSconds) {
      _appcontroller.onUserActivity();
      _appcontroller.checkUserNotUseApp();
    }
  }
}
