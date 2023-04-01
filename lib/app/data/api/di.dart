// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/data/provider/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/app_module/app_controller.dart';
import '../../utils/app_prefs.dart';
import '../provider/remote_date_source.dart';
import '../services/repository.dart';
import 'app_api.dart';
import 'dio_factory.dart';
import 'network_info.dart';

initDependencies() async {
  final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  Get.put(_sharedPreferences);
  Get.put(AppPreferences(_sharedPreferences));
  Get.put(AppController());
  Get.put(DioFactory(Get.find()));
  Get.put<NetworkInfo>(NetworkInfoImpl(DataConnectionChecker()));
  final dio = await Get.find<DioFactory>().getDio();
  Get.put(DioFactory(Get.find()));
  Get.put<AppServiceClient>(AppServiceClient(dio));
  Get.put<RemoteDataSource>(RemoteDataSourceImplementer(Get.find()));
  Get.put<LocalDataSource>(LocalDataSourceImplementer());
  Get.put<Repository>(RepositoryImpl(Get.find(), Get.find(), Get.find()));
}
