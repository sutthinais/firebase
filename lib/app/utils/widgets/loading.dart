import 'package:flutter/material.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:lottie/lottie.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

Widget loading(context) {
  return _getPopUpDialog(context, [_getAnimatedImage(JsonAssets.loading), _getMessage(AppTranslationKey.TEXT_LOADING, context)]);
}

Widget _getAnimatedImage(String animationName) {
  return SizedBox(
    height: AppSize.s100,
    width: AppSize.s100,
    child: Lottie.asset(animationName),
  );
}

Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
  return Scaffold(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
    body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        // color: Theme.of(context).t,
        child: _getDialogContent(context, children)),
  );
}

Widget _getDialogContent(BuildContext context, List<Widget> children) {
  return Dialog(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}

Widget _getMessage(String message, context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
