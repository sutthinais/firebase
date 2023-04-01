import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";
  String platform = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android device info
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + build.model;
      identifier = build.fingerprint;
      version = AppTranslationKey.APP_VERSION;
      // version = build.version.codename!;
      platform = "android";
    } else if (Platform.isIOS) {
      // return ios device info
      var build = await deviceInfoPlugin.iosInfo;
      name = build.name! + build.model!;
      identifier = build.identifierForVendor!;
      version = AppTranslationKey.APP_VERSION;
      // version = build.systemVersion!;
      platform = "ios";
    }
  } on PlatformException {
    // return default data here
    return DeviceInfo(name, identifier, version, platform);
  }
  return DeviceInfo(name, identifier, version, platform);
}

bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;
  String platform;

  DeviceInfo(this.name, this.identifier, this.version, this.platform);
}
