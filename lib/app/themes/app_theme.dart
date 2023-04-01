// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getx_home_service/app/themes/app_colors.dart';
import 'app_text_theme.dart';
import '../resources/values_manager.dart';

final textTheme = TextTheme(
  headline1: GoogleFonts.kanit(),
  headline2: GoogleFonts.kanit(),
  headline3: GoogleFonts.kanit(),
  headline4: GoogleFonts.kanit(),
  headline5: GoogleFonts.kanit(),
  headline6: GoogleFonts.kanit(),
  subtitle1: GoogleFonts.kanit(),
  subtitle2: GoogleFonts.kanit(),
  bodyText1: GoogleFonts.kanit(),
  bodyText2: GoogleFonts.kanit(),
  button: GoogleFonts.kanit(),
  caption: GoogleFonts.kanit(),
  overline: GoogleFonts.kanit(),
  // labelLarge: GoogleFonts.sarabun(),
  // displayLarge: GoogleFonts.sarabun(),
);

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimaryColor,
    accentColor: AppColors.red,
    backgroundColor: AppColors.white,
    primaryColorBrightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    primaryColorLight: AppColors.black,
    // colorScheme: ThemeData().colorScheme.copyWith(secondary: AppColors.kPrimaryColor),
    textTheme: textTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.kPrimaryColor,
    ),
    primaryColorDark: AppColors.colorDivider,
    disabledColor: AppColors.gray,
    // ripple color
    splashColor: AppColors.kPrimaryColor,
    // card view theme
    cardTheme: const CardTheme(color: AppColors.white, shadowColor: AppColors.gray, elevation: AppSize.s4),
    // App bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s0,
      color: AppColors.white,
      shadowColor: AppColors.colorDivider,
      titleTextStyle: AppTextStyles.base,
    ),
    // Button theme
    buttonTheme: const ButtonThemeData(shape: StadiumBorder(), disabledColor: AppColors.gray, buttonColor: AppColors.kPrimaryColor, splashColor: AppColors.kPrimaryColor),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, AppSize.s40 + 20),
        textStyle: AppTextStyles.base.s16.whiteColor,
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s100),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(AppTextStyles.base),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      constraints: const BoxConstraints.tightFor(width: double.infinity, height: AppSize.s40 + 20),
      contentPadding: const EdgeInsets.all(AppPadding.p20),
      focusColor: AppColors.kPrimaryColor,
      fillColor: AppColors.gray.withOpacity(.2),
      filled: true,
      prefixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.kPrimaryColor : Colors.grey),
      suffixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.kPrimaryColor : Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s100),
      ),

      // hint style
      hintStyle: AppTextStyles.base.neutral3Color,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      // label style
      labelStyle: AppTextStyles.base.blackColor,
      // error style
      errorStyle: AppTextStyles.base.redColor,
      disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // enabled border
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // focused border
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // error border
      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s0), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // focused error border
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    accentColor: AppColors.red,
    primaryColorLight: AppColors.white,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: textTheme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
    ),
    primaryColorDark: AppColors.colorDivider,
    disabledColor: AppColors.gray,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(AppTextStyles.base),
      ),
    ),
    // ripple color
    splashColor: AppColors.kPrimaryColor,
    // card view theme
    cardTheme: const CardTheme(color: AppColors.white, shadowColor: AppColors.gray, elevation: AppSize.s4),
    // App bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true, elevation: AppSize.s0, shadowColor: AppColors.colorDivider, titleTextStyle: AppTextStyles.base, color: AppColors.black,
      // color: AppColors.black,
    ),
    // Button theme
    buttonTheme: const ButtonThemeData(shape: StadiumBorder(), disabledColor: AppColors.gray, buttonColor: AppColors.kPrimaryColor, splashColor: AppColors.kPrimaryColor),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, AppSize.s40 + 20),
        textStyle: AppTextStyles.base.s16.whiteColor,
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s100),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      constraints: const BoxConstraints.tightFor(width: double.infinity, height: AppSize.s40 + 20),
      contentPadding: const EdgeInsets.all(AppPadding.p20),
      focusColor: AppColors.white,
      fillColor: AppColors.gray.withOpacity(.2),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s100),
      ),
      suffixIconColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.focused) ? AppColors.white : Colors.grey),
      // hint style
      hintStyle: AppTextStyles.base.whiteColor.copyWith(color: AppColors.gray.withOpacity(.4)),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      // label style
      labelStyle: AppTextStyles.base.neutral3Color,
      // error style
      errorStyle: AppTextStyles.base.redColor,
      disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // enabled border
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // focused border
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // error border
      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s0), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
      // focused error border
      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: AppSize.s1_5), borderRadius: BorderRadius.all(Radius.circular(AppSize.s100))),
    ),
  );
}
