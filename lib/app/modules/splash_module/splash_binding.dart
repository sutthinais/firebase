// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/splash_module/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/app_api.dart';
import '../../data/api/dio_factory.dart';
import '../../utils/app_prefs.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(SplashController());
    final sharedPrefs = await SharedPreferences.getInstance();
    Get.lazyPut<AppPreferences>(() => AppPreferences(sharedPrefs));
    final AppPreferences appPreferences = Get.find<AppPreferences>();
    Get.lazyPut<DioFactory>(() => DioFactory(appPreferences));
    final dio = await Get.find<DioFactory>().getDio();
    Get.lazyPut<AppServiceClient>(() => AppServiceClient(dio));
  }
}
