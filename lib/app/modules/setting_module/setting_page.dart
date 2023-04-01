import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/data/models/user.dart';
import 'package:getx_home_service/app/resources/assets_manager.dart';
import 'package:getx_home_service/app/resources/values_manager.dart';
import '../../../app/modules/setting_module/setting_controller.dart';
import '../../routes/app_pages.dart';
import '../../themes/app_theme.dart';
import '../../translations/app_translations.dart';
import '../../utils/app_prefs.dart';

class SettingPage extends GetWidget<SettingController> {
  SettingPage({Key? key}) : super(key: key);
  final AppPreferences _preferences = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppTranslationKey.TEXT_SETTING,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(AppSize.s20),

                const CardProfile(),
                const StatusProfile(),
                // Generated code for this isDarkMode Widget...
                Obx(
                  () => ChangeTheme(
                    value: controller.isDarkMode.value,
                    press: () {
                      var value = controller.isDarkMode.toggle();

                      Get.changeTheme(value.value ? Themes.light : Themes.dark);
                      controller.setTheme(value.value ? 'light' : 'light');
                    },
                  ),
                ),
                Obx(
                  () => ChangeLanguage(
                    value: controller.isChangeLanguage.value,
                    press: () {
                      if (!controller.isChangeLanguage.value) {
                        controller.setLocalLanguage('th_TH');
                      } else {
                        controller.setLocalLanguage('en_EN');
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).highlightColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: Theme.of(context).primaryColorLight,
                              size: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                AppTranslationKey.TEXT_EDIT_PROFILE,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const SizedBox(
                              width: 80,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),
                ElevatedButton(
                    onPressed: () async {
                      await _preferences.logout();
                      Get.offAllNamed(AppRoutes.login);
                    },
                    child: Text(AppTranslationKey.TEXT_LOGOUT)),
                const Gap(AppSize.s20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatusProfile extends StatelessWidget {
  const StatusProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).highlightColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Icon(
                  Icons.power_settings_new_rounded,
                  color: Theme.of(context).primaryColorLight,
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    AppTranslationKey.TEXT_PROFILE_STATUS,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0, 0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.9, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0),
                          child: Icon(
                            Icons.wb_sunny_rounded,
                            color: Theme.of(context).primaryColorLight,
                            size: 24,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.9, 0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(context).dialogBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x430B0D0F),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.network(
            'https://employee-img.homeone.co.th/img/${userInfo.userId}.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ChangeTheme extends StatelessWidget {
  final bool value;
  final Function()? press;
  const ChangeTheme({
    super.key,
    required this.value,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).highlightColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Icon(
                  value ? Icons.wb_sunny_outlined : Icons.nights_stay,
                  color: Theme.of(context).primaryColorLight,
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    !value ? "${AppTranslationKey.TEXT_THEME}${AppTranslationKey.TEXT_LIGHT}" : "${AppTranslationKey.TEXT_THEME}${AppTranslationKey.TEXT_DARK}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: press,
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0, 0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.9, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0),
                          child: Icon(
                            value ? Icons.nights_stay : Icons.wb_sunny_rounded,
                            color: Theme.of(context).primaryColorLight,
                            size: 24,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.9, 0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(context).dialogBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x430B0D0F),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeLanguage extends StatelessWidget {
  final bool value;
  final Function()? press;
  const ChangeLanguage({
    super.key,
    required this.value,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).highlightColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                child: Image.asset(
                  value ? IconAssets.ICON_TH : IconAssets.ICON_EN,
                  width: AppSize.s28,
                  height: AppSize.s28,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    "${AppTranslationKey.TEXT_CHNANGE_LANGUAGE} (${AppTranslationKey.TEXT_ENGLISH})",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              GestureDetector(
                onTap: press,
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0, 0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(value ? -.9 : 0.9, 0),
                        child: Padding(
                            padding: value ? const EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0) : const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 2),
                            child: Image.asset(
                              value ? IconAssets.ICON_TH : IconAssets.ICON_EN,
                              width: AppSize.s28,
                              height: AppSize.s28,
                            )
                            //  Icon(
                            //   controller.isDarkMode.value ? Icons.nights_stay : Icons.wb_sunny_rounded,
                            //   color: Theme.of(context).primaryColorDark,
                            //   size: 24,
                            // ),
                            ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(!value ? -0.9 : 0.9, 0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x430B0D0F),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
