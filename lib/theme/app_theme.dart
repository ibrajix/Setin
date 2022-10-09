import 'package:flutter/material.dart';
import 'package:setin/theme/colors.dart';

enum AppTheme {
  lightMode,
  darkMode
}

final appThemeData = {

  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColorLight,
    fontFamily: 'InterTight',
  ),

  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    fontFamily: 'InterTight'
  )

};