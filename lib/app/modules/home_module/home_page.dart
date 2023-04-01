// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/data/model/all/jobs_model.dart';
import 'package:getx_home_service/app/data/models/user.dart';
import 'package:getx_home_service/app/modules/base_module/base_module.dart';
import 'package:getx_home_service/app/modules/home_module/home_controller.dart';
import 'package:getx_home_service/app/resources/assets_manager.dart';
import 'package:getx_home_service/app/resources/values_manager.dart';
import 'package:gap/gap.dart';
import 'package:getx_home_service/app/routes/app_pages.dart';
import 'package:getx_home_service/app/themes/app_colors.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../themes/app_text_theme.dart';
import '../../utils/widgets/loading.dart';

class HomePage extends GetWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final AppPreferences preferences = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Obx(
          () => WillPopScope(
            onWillPop: () {
              return controller.state.value == EventState.SUCCESS_STATE ? Future.value(false) : Future.value(false);
            },
            child: Scaffold(
              key: _globalKey,
              drawer: DrawerRx(stateKey: _globalKey, preferences: preferences),
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  AppTranslationKey.APP_NAME_TH,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                // leading: const SizedBox(),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      _globalKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      FeatherIcons.user,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  const Gap(AppSize.s10)
                ],
              ),
              body: Stack(
                children: [Widgetcontent(controller: controller), controller.state.value == EventState.LOADING_STATE ? loading(context) : Container()],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Widgetcontent extends StatelessWidget {
  final HomeController controller;

  const Widgetcontent({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController.value,
      onRefresh: () async {
        // ดึงข้อมูลใหม่
        await controller.getDataFromApi();
        controller.refreshController.value.refreshCompleted();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // ElevatedButton(
            //   onPressed: () => controller.getDataFromApi(),
            //   child: Text(AppTranslationKey.TEXT_USER_NAME),
            // ),
            const Gap(AppSize.s20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: AppTranslationKey.TEXT_SEARCH_NAME_AND_PHONE_NUMBER_CUSTOMER,
                      prefixIcon: GestureDetector(
                        child: const Icon(FeatherIcons.search),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: AppSize.s100 - 20,
                  height: AppSize.s100 - 41,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(AppSize.s100),
                    shape: BoxShape.circle,
                    color: AppColors.gray.withOpacity(.2),
                  ),
                  child: getImage(IconAssets.ICON_FILTER, color: Theme.of(context).primaryColorLight, showcolor: true),
                )
              ],
            ),
            const Gap(AppSize.s10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("เลขอ้างอิง"),
                Text("สถานะ"),
              ],
            ),
            const Gap(AppSize.s10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.jobsList.length,
                  itemBuilder: (context, index) {
                    Jobs job = controller.jobsList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: AppSize.s1_5 * 2),
                      decoration: BoxDecoration(color: AppColors.gray.withOpacity(.3), borderRadius: BorderRadius.circular(AppSize.s10 - 2)),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Expanded(
                            //   child: Container(
                            //     alignment: Alignment.centerLeft,
                            //     height: AppSize.s40,
                            //     decoration: BoxDecoration(color: AppColors.gray.withOpacity(.5), shape: BoxShape.circle),
                            //     child: getImage(IconAssets.ICON_FOLDER),
                            //   ),
                            // ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '${job.docCode}Q-20230202933',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: AppMargin.m12,
                                    height: AppMargin.m12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: job.enumToColor(),
                                    ),
                                  ),
                                  const Gap(AppSize.s4),
                                  Text(job.enumToString(), style: Theme.of(context).textTheme.bodySmall!),
                                ],
                              ),
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("เบอร์ติดต่อลูกค้า : ${job.phoneCustomer}", style: Theme.of(context).textTheme.bodySmall!),
                            Text("ชื่อลูกค้า : ${job.customerName}", style: Theme.of(context).textTheme.bodySmall!),
                            Text("สินค้า / บริการ : ${job.servicesName}", style: Theme.of(context).textTheme.bodySmall!),
                            Text("ชื่อทีมช่าง : ${job.teamName}", style: Theme.of(context).textTheme.bodySmall!),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerRx extends StatelessWidget {
  final GlobalKey<ScaffoldState> stateKey;
  const DrawerRx({super.key, required this.stateKey, required this.preferences});
  final AppPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.transparent,
      child: Container(
        alignment: Alignment.topLeft,
        width: Get.width * .7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppSize.s12),
            topRight: Radius.circular(AppSize.s12),
          ),
          color: AppColors.kPrimaryColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              getImage(IconAssets.ICON_HOME_SERVICE_PRIMARY, width: 221, height: AppSize.s100 - 46),
              // Gap(AppSize.s20),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  userInfo.fullName ?? "",
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_PROFILE, width: AppSize.s20, height: AppSize.s20),
              ),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  userInfo.userGroupName ?? "",
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_3USER, width: AppSize.s20, height: AppSize.s20),
              ),
              const Divider(
                color: AppColors.gray,
              ),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  AppTranslationKey.TEXT_TRACKING_STATUS,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_FOLDER, width: AppSize.s20, height: AppSize.s20),
              ),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  AppTranslationKey.TEXT_DOWNLOAD_REPORTS,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_ARROW_DOWNSQUARE, width: AppSize.s20, height: AppSize.s20),
              ),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  AppTranslationKey.TEXT_SUMMARY_ALL_PAYMENT,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_ACTIVITY, width: AppSize.s20, height: AppSize.s20),
              ),
              const Spacer(),
              ListTile(
                minLeadingWidth: AppSize.s20,
                title: Text(
                  AppTranslationKey.APP_VERSION,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_TICKSQUARE, width: AppSize.s20, height: AppSize.s20),
              ),
              ListTile(
                minLeadingWidth: AppSize.s20,
                onTap: () {
                  stateKey.currentState?.openEndDrawer();
                  Get.toNamed(AppRoutes.setting);
                },
                title: Text(
                  AppTranslationKey.TEXT_SETTING,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_SETTING, width: AppSize.s20, height: AppSize.s20),
              ),
              ListTile(
                onTap: () async {
                  await preferences.logout();
                  Get.offAllNamed(AppRoutes.login);
                },
                minLeadingWidth: AppSize.s20,
                title: Text(
                  AppTranslationKey.TEXT_LOGOUT,
                  style: AppTextStyles.base.w300.neutral3Color.s14,
                ),
                leading: getImage(IconAssets.ICON_LOGOUT, width: AppSize.s20, height: AppSize.s20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarGetx extends StatelessWidget {
  const AppBarGetx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      left: AppSize.s0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSize.s10 - 5),
          height: AppSize.s40 + 10,
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.gray,
                offset: Offset(0, 3),
                blurRadius: AppSize.s1_5,
              ),
            ],
          ),

          // height: AppSize.s100,
          width: appSize.width,
          child: Row(
            children: [
              const Gap(AppSize.s10),
              getImage(IconAssets.ICON_HOME_SERVICE_WHITE, height: 40, width: 160),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.offAllNamed(AppRoutes.login),
                child: Container(
                  width: AppSize.s40,
                  height: AppSize.s40,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.kPrimaryColor),
                  child: const Icon(
                    FeatherIcons.user,
                    color: AppColors.white,
                  ),
                ),
              ),
              const Gap(AppSize.s10)
            ],
          ),
        ),
      ),
    );
  }
}
