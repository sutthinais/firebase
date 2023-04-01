import 'package:get/get.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';
import '../../../app/modules/setting_module/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    final AppPreferences appPreferences = Get.find<AppPreferences>();
    Get.lazyPut<SettingController>(
      () => SettingController(appPreferences),
    );
  }
}
