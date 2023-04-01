// ignore_for_file: prefer_final_fields, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/routes/app_pages.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';
import 'package:getx_home_service/app/utils/extensions.dart';
import 'package:getx_home_service/app/utils/widgets/dialog2.dart';

class AppController extends GetxController {
  final AppPreferences _preferences = Get.find();
  AppController();
  // กำหนดเวลาในการใช้งาน
  int _maxSeconds = 6000; // 60*1000 = 1 min

  // สร้างตัวแปรสำหรับเก็บเวลาที่ผ่านไป
  var _seconds = 0.obs;

  // สร้าง Event เพื่อตรวจสอบการใช้งาน
  void onUserActivity() => _seconds.value = 0;

  RxInt get seconds => _seconds;
  int get maxSconds => _maxSeconds;

  // สร้าง Timer สำหรับลดเวลา
  Timer? _timer;

  @override
  void onInit() {
    checkUserNotUseApp();
    super.onInit();
  }

  @override
  void onReady() {
    // checkUserNotUseApp();
  }

  checkUserNotUseApp() async {
    // ตั้งค่า Timer ให้เริ่มนับเวลาเมื่อแอพถูกเปิด
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      "Time countdown ${_seconds.value}".logStr();
      // ถ้าผู้ใช้งานไม่ได้ใช้งานแอพ ให้ลดเวลาลง 1 วินาที
      if (_seconds.value < _maxSeconds) {
        _seconds.value++;
      } else {
        // ถ้าเวลาเกินกำหนด ให้แสดงป๊อบอัพแจ้งเตือนและปิดแอพ
        _timer?.cancel();
        Get.dialog(ErrorDialog(
            isDiss: false,
            message: AppTranslationKey.NOT_USE_APP_TIMEOUT,
            ok: () {
              _preferences.logout();
              Get.offAllNamed(AppRoutes.login);
            },
            content: null));
        return;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
