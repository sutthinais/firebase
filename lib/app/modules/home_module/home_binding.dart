import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/home_module/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(HomeController());
  }
}
