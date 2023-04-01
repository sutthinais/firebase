// ignore_for_file: constant_identifier_names, prefer_final_fields, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../utils/app_prefs.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration _timeOut = const Duration(seconds: 10); // 10 min
    Locale? language = Get.deviceLocale;
    String languages = language == null ? "th" : language.languageCode;
    String token = await _appPreferences.getUserPrivateToken();
    Map<String, String> headers = {CONTENT_TYPE: APPLICATION_JSON, ACCEPT: APPLICATION_JSON, AUTHORIZATION: "Bearer $token", DEFAULT_LANGUAGE: languages};

    dio.options = BaseOptions(baseUrl: EndPoints.baseUrl, connectTimeout: _timeOut, receiveTimeout: _timeOut, headers: headers);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
