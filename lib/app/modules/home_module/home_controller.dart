// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:get/get.dart';
import 'dart:math';
import 'package:getx_home_service/app/data/model/all/jobs_model.dart';
import 'package:getx_home_service/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../app_module/app_controller.dart';
import '../base_module/base_module.dart';

class HomeController extends GetxController {
  final AppController _appController = Get.find();

  RxList<Jobs> jobsList = <Jobs>[].obs;
  var scrollController = ScrollController().obs;
  var refreshController = RefreshController().obs;
  final _state = Rx<EventState>(EventState.SUCCESS_STATE);
  Rx<EventState> get state => _state;
  var isShowFilter = false.obs;

  @override
  void onInit() async {
    await getDataFromApi();
    super.onInit();
  }

  fackApi() async {
    await Future.delayed(const Duration(seconds: 3));
    return RxList.generate(
      100,
      (index) => Jobs(
        docCode: index + 1,
        name: 'Job ${index + 1}',
        createDate: DateTime.now().subtract(Duration(days: Random().nextInt(30))),
        status: JobStatus.values[Random().nextInt(JobStatus.values.length)],
        customerName: 'Customer ${index + 1}',
        phoneCustomer: '123-456-${1000 + index}',
        addressCustomer: '${index + 1} Main St, Anytown USA',
        servicesName: 'Service ${index + 1} Renovate ปรับปรุง ต่อเติม dolor sit amet',
        servicesCode: 'SRV${index + 1}',
        teamCode: 'TEAM${Random().nextInt(3) + 1}',
        teamName: 'Team ${Random().nextInt(3) + 1}',
      ),
    );
  }

  getDataFromApi() async {
    _state(EventState.LOADING_STATE);
    "getDataFromApi".logStr();
    jobsList = await fackApi();
    _state(EventState.SUCCESS_STATE);
  }
}

List<String> filterCategoryList = [
  "รางน้ำฝน",
  "ตัดหญ้าและดูแลสวน",
  "โครงหลังคาสำเร็จรูป",
  "แก้ไขท่อน้ำอุดตัน",
  "หลังคาโรงรถ-กันสาด",
  "พ่นฆ่าเชื้อ",
  "ล้างเครื่องซักผ้า",
  "บริการปรับปรุงหลังคาและ",
  "ดาดฟ้าบ้าน",
  "ล้างแอร์ / อบโอโซน / ดูดไรฝุ่น",
  "รั้วและพื้นไม้ SCG",
  "ฝ้าชายคาไวนิล",
  "ต่อเติมครัว",
  "ตรวจสอบและซ่อมเครื่องปรับ",
  "อากาศ",
  "กระเบื้องคอนกรีตปูพื้น",
  "ภายนอก SCG Landscape",
  "บริการขนย้ายของ",
  "พื้นไวนิล",
  "ปิดโพรงรอบบ้าน",
  "กำจัดปลวกและแมลง",
  "กันซึมและงานเคลือบพื้น",
  "บริการติดตั้งเครื่องปรับอากาศ",
  "(เฉพาะค่าแรง)",
  "ผนังกันเสียงคอนโด",
  "ล้างบ่อตักไขมัน",
  "ฝ้าและผนังยิปซัม ตราช้าง ผนังกันเสียง cozy wall",
  "ทำความสะอาด",
  "ฟิลม์กรองแสงบ้านและอาคาร",
  "ระแนงบังตาไวนิล",
  "เครื่องปรับอากาศ พร้อมติดตั้ง",
  "งานไฟฟ้า",
  "บริการติดตั้งเครื่องทำน้ำอุ่น",
  "เครื่องฟอกอากาศ Air-e X",
  "(แอร์ อี เอ็กซ์)",
  "โซลาร์เซลล์",
  "บริการติดตั้งพื้นทุกชนิด",
  "(เฉพาะค่าแรง)",
  "My Home บริการทำความสะอาด ที่นอน",
  "เฟอร์นิเจอร์"
];
