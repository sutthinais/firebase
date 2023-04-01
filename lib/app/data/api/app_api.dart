// ignore_for_file: unused_import

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../utils/constants.dart';
import '../model/response/base_response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/assets/login")
  Future<BaseResponseModel> login(
    @Field("userid") String userid,
    @Field("password") String password,
    @Field("db") String db,
    @Field("name") String name,
    @Field("identifier") String identifier,
    @Field("version") String version,
    @Field("platform") String platform,
  );
}
