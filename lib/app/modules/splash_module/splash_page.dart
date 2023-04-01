// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/values_manager.dart';
import '../../translations/app_translations.dart';

class SplashPage extends GetWidget<GetxController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color: Theme.of(context).primaryColorDark,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
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
        ]),
      ),
    );
  }
}
