import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/setting_module/setting_binding.dart';
import 'package:getx_home_service/app/modules/setting_module/setting_page.dart';
import 'package:getx_home_service/app/modules/home_module/home_binding.dart';
import 'package:getx_home_service/app/modules/login_module/login_binding.dart';
import 'package:getx_home_service/app/modules/splash_module/splash_binding.dart';
import 'package:getx_home_service/app/modules/splash_module/splash_page.dart';
import 'package:getx_home_service/app/modules/login_module/login_page.dart';
import 'package:getx_home_service/app/modules/home_module/home_page.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
