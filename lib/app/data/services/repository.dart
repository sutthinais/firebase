// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/app_module/app_controller.dart';

import '../../utils/app_prefs.dart';
import '../api/error_handler.dart';
import '../api/failure.dart';
import '../api/network_info.dart';
import '../model/all/user_model.dart';
import '../model/request/request.dart';
import '../provider/local_data_source.dart';
import '../provider/remote_date_source.dart';

abstract class Repository {
  Future<Either<Failure, UserInfo>> isLoggedIn({required LoginRequest loginRequest});
}

class RepositoryImpl implements Repository {
  final RemoteDataSource _apiService;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._localDataSource, this._apiService);
  AppPreferences appPreferences = Get.find<AppPreferences>();
  final AppController _appController = Get.find();

  @override
  Future<Either<Failure, UserInfo>> isLoggedIn({required LoginRequest loginRequest}) async {
    _appController.onUserActivity();
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.isLoggedIn(loginRequest: loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          if (response.data == null) return Left(Failure(1, "Error Data is NULL"));
          return Right(UserInfo.fromJson(response.data));
        } else {
          if (response.message == ResponseMessage.VERSION_IS_NOT_VALID) {
            appPreferences.setIsAppVersion('0.0.0');
          }
          return Left(Failure(response.status, response.message));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
