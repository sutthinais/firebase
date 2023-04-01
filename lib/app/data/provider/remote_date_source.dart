// ignore_for_file: prefer_final_fields

import '../api/app_api.dart';
import '../model/request/request.dart';
import '../model/response/base_response.dart';

abstract class RemoteDataSource {
  Future<BaseResponseModel> isLoggedIn({required LoginRequest loginRequest});
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);
  @override
  Future<BaseResponseModel> isLoggedIn({required LoginRequest loginRequest}) {
    return _appServiceClient.login(loginRequest.userid, loginRequest.password, loginRequest.db, loginRequest.name, loginRequest.deviceInfo.identifier, loginRequest.deviceInfo.version, loginRequest.deviceInfo.platform);
  }
}
