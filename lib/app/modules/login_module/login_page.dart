import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/base_module/base_module.dart';

import 'package:getx_home_service/app/themes/app_colors.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:getx_home_service/app/utils/widgets/loading.dart';

import '../../resources/values_manager.dart';
import '../../themes/app_text_theme.dart';
import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: GetBuilder<LoginController>(
          builder: (LoginController controller) {
            return Obx(() {
              return Stack(
                children: [
                  Widgetcontent(controller: controller),
                  controller.state.value == EventState.LOADING_STATE ? loading(context) : Container(),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}

class Widgetcontent extends StatelessWidget {
  final LoginController controller;
  const Widgetcontent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
        child: ListView(
          shrinkWrap: true,
          children: [
            // getImage(IconAssets.ICON_HOME_SERVICE_WHITE, width: 60, height: 60),
            Text(
              AppTranslationKey.APP_NAME_TH,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: AppSize.s20 + 5, letterSpacing: 4.0),
            ),
            Text(
              AppTranslationKey.APP_NAME_EN,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: AppSize.s20 - 5, letterSpacing: 4.0),
            ),
            const Gap(AppSize.s40),
            TextFormField(
              controller: controller.userid,
              decoration: InputDecoration(
                hintText: AppTranslationKey.TEXT_USER_NAME,
              ),
            ),
            const Gap(AppSize.s10),
            Obx(
              () => TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                  hintText: AppTranslationKey.TEXT_PASSWORD,
                  suffixIcon: GestureDetector(
                    onTap: controller.isShowPassword,
                    child: Icon(controller.showPassword.value ? FeatherIcons.eye : FeatherIcons.eyeOff),
                  ),
                ),
                obscureText: controller.showPassword.value,
              ),
            ),
            const Gap(AppSize.s10),
            ElevatedButton(
              onPressed: () async {
                controller.login();
              },
              child: Text(
                AppTranslationKey.TEXT_LOGIN,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontSize: AppSize.s16),
              ),
            ),
            const Gap(AppSize.s40),
            Text(
              AppTranslationKey.APP_VERSION_NAME + AppTranslationKey.APP_VERSION,
              textAlign: TextAlign.center,
              style: AppTextStyles.base.neutral3Color,
            ),
          ],
        ),
      ),
    );
  }
}
