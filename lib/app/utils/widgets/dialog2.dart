// ignore_for_file: must_be_immutable, constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:gap/gap.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class CustomDialog {
  String message;
  String title;
  String? jsonAssets;
  Function? leftActionFunction;
  Function? rightActionFunction;
  String? buttonTitleLeft;
  String? buttonTitleRight;
  Widget? content;
  bool disMin;
  bool onWillPop;
  bool? isShowAnimate;
  CustomDialog({Key? key, bool? dis, bool? onWill, String? message, String? title, this.isShowAnimate, required this.leftActionFunction, required this.rightActionFunction, required this.content})
      : message = message ?? AppTranslationKey.TEXT_EMPTY,
        title = title ?? AppTranslationKey.TEXT_EMPTY,
        disMin = dis ?? true,
        onWillPop = onWill ?? true;

  showPopUp(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: disMin,
      builder: (BuildContext context) => ActionButton(
        leftActionFunction: leftActionFunction,
        rightActionFunction: rightActionFunction,
        content: content,
        message: message,
        isShowAnimate: isShowAnimate,
        title: title,
      ),
    );
  }

  showErrorPopUp(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: disMin,
      builder: (BuildContext context) => ErrorDialog(
        ok: leftActionFunction,
        content: content,
        message: message,
        title: title,
      ),
    );
  }

  showSuccessPopUp(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: disMin,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SuccessDialog(
          ok: leftActionFunction,
          content: content,
          message: message,
          title: title,
        ),
      ),
    );
  }

  showLoadingPopUp(BuildContext context) {
    return showDialog(
      barrierDismissible: disMin,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () {
          return Future.value(onWillPop);
        },
        child: LoadingDialog(
          message: message,
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget with GetWidgetContent {
  String message;
  String title;
  String? jsonAssets;
  Function? leftActionFunction;
  Function? rightActionFunction;
  String? buttonTitleLeft;
  String? buttonTitleRight;
  Widget? content;
  bool? isDiss;
  bool? isShowAnimate;
  ActionButton({Key? key, this.isShowAnimate, bool? isDiss, String? message, String? title, required this.leftActionFunction, required this.rightActionFunction, required this.content})
      : message = message ?? AppTranslationKey.TEXT_EMPTY,
        title = title ?? AppTranslationKey.TEXT_EMPTY,
        isDiss = isDiss ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return getStateWidget(context);
  }

  @override
  getStateWidget(context) {
    return _getPopUpDialog(context, [
      if (isShowAnimate ?? true) _getAnimatedImage(jsonAssets ?? JsonAssets.error),
      _getMessage(message, context),
      content ?? SizedBox.shrink(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (leftActionFunction != null) ...[
            Expanded(child: _getRetryButton(buttonTitleLeft ?? AppTranslationKey.TEXT_OK, false, context)),
            if (rightActionFunction != null) Gap(AppSize.s20),
          ],
          if (rightActionFunction != null) ...[
            Expanded(child: _getRetryButton(buttonTitleRight ?? AppTranslationKey.TEXT_OK, true, context)),
          ],
        ],
      )
    ]);
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(AppSize.s14), boxShadow: [BoxShadow(color: Colors.black26, blurRadius: AppSize.s12, offset: Offset(AppSize.s0, AppSize.s12))]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message, BuildContext context) {
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

  Widget _getRetryButton(String buttonTitle, bool isActive, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                backgroundColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              onPressed: () {
                if (!isActive) {
                  leftActionFunction?.call();
                } else {
                  rightActionFunction?.call();
                }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget with GetWidgetContent {
  String message;
  String title;
  String? jsonAssets;
  Function? ok;
  String? buttonTitleLeft;
  String? buttonTitleRight;
  Widget? content;
  bool? isDiss;
  ErrorDialog({Key? key, bool? isDiss, String? message, String? title, required this.ok, required this.content})
      : message = message ?? AppTranslationKey.TEXT_DEFUALT_ERROR,
        title = title ?? AppTranslationKey.TEXT_EMPTY,
        isDiss = isDiss ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: getStateWidget(context),
      onWillPop: () {
        return isDiss == null
            ? Future.value(true)
            : isDiss!
                ? Future.value(true)
                : Future.value(false);
      },
    );
  }

  @override
  getStateWidget(context) {
    return _getPopUpDialog(context, [
      content ?? SizedBox.shrink(),
      _getAnimatedImage(jsonAssets ?? JsonAssets.error),
      _getMessage(message, context),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Expanded(child: _getRetryButton(buttonTitleRight ?? AppTranslationKey.TEXT_OK, true, context))],
      )
    ]);
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(AppSize.s14), boxShadow: [BoxShadow(color: Colors.black26, blurRadius: AppSize.s12, offset: Offset(AppSize.s0, AppSize.s12))]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message, BuildContext context) {
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

  Widget _getRetryButton(String buttonTitle, bool isActive, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                backgroundColor: (ok == null) ? Theme.of(context).cardColor : Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              onPressed: () {
                ok?.call();
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget with GetWidgetContent {
  String message;
  String title;
  String? jsonAssets;
  Function? ok;
  String? buttonTitleLeft;
  String? buttonTitleRight;
  Widget? content;
  bool? isDiss;
  SuccessDialog({Key? key, bool? isDiss, String? message, String? title, required this.ok, required this.content})
      : message = message ?? AppTranslationKey.TEXT_DEFUALT_ERROR,
        title = title ?? AppTranslationKey.TEXT_EMPTY,
        isDiss = isDiss ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return getStateWidget(context);
  }

  @override
  getStateWidget(context) {
    return _getPopUpDialog(context, [
      content ?? SizedBox.shrink(),
      _getAnimatedImage(jsonAssets ?? JsonAssets.empty),
      _getMessage(message, context),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Expanded(child: _getRetryButton(buttonTitleRight ?? AppTranslationKey.TEXT_OK, true, context))],
      )
    ]);
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(AppSize.s14), boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: AppSize.s12,
            offset: Offset(AppSize.s0, AppSize.s12),
          ),
        ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
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

  Widget _getRetryButton(String buttonTitle, bool isActive, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                backgroundColor: isActive ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              onPressed: () {
                ok?.call();
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget with GetWidgetContent {
  String message;
  String? jsonAssets;
  bool? isDiss;
  LoadingDialog({Key? key, bool? isDiss, String? message})
      : message = message ?? AppTranslationKey.TEXT_DEFUALT_ERROR,
        isDiss = isDiss ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return getStateWidget(context);
  }

  @override
  getStateWidget(context) {
    return _getPopUpDialog(context, [
      _getAnimatedImage(jsonAssets ?? JsonAssets.loading),
      _getMessage(message, context),
    ]);
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(AppSize.s14), boxShadow: [BoxShadow(color: Colors.black26, blurRadius: AppSize.s12, offset: Offset(AppSize.s0, AppSize.s12))]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
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
}

abstract class GetWidgetContent {
  getStateWidget(context);
}
