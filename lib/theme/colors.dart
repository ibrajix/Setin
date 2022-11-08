import 'package:flutter/material.dart';

class AppColors {

  //light mode colors
  static const primaryColorLight = Color(0xFFFFFFFF);
  static const shadeGreyLight = Color(0xFFf6F5F8);
  static const bgGreyLight = Color(0xFFA1A1A1);
  static const bgShadeBrownLight = Color(0xFFFEF0E4);
  static const bgContentBrownLight = Color(0xFFfd6a22);
  static const bgBlueLight = Color(0xFFa7e5ff);
  static const bgContentBlueLight = Color(0xFF1ebafb);
  static const bgPurpleLight = Color(0xFFecebff);
  static const bgPurpleContentLight = Color(0xFF5732fb);


  //dark mode colors
  static const primaryColorDark = Color(0xFF302b53);
  static const shadeGreyDark = Color(0x80302B53);
  static const bgGreyDark = Color(0xFFDDDDDD);
  static const bgShadeBrownDark = Color(0xFFbb8b7f);
  static const bgContentBrownDark = Color(0xFFfd6a22);
  static const bgBlueDark = Color(0xFF233f81);
  static const bgContentBlueDark = Color(0xFF1fb9fb);
  static const bgPurpleDark = Color(0xFF393e84);
  static const bgPurpleContentDark = Color(0xFF233e7f);

}

extension CustomColorSchemeX on ColorScheme {

  Color? get customGreyBg => brightness == Brightness.light ? AppColors.shadeGreyLight : AppColors.shadeGreyDark;

  Color? get customContentInGreyBg => brightness == Brightness.light ? AppColors.bgGreyLight : AppColors.bgGreyDark;

  Color? get customBrownBg => brightness == Brightness.light ? AppColors.bgShadeBrownLight : AppColors.bgShadeBrownDark;

  Color? get customContentBrownBg => brightness == Brightness.light ? AppColors.bgContentBrownLight : AppColors.bgContentBrownDark;

  Color? get customBlueBg => brightness == Brightness.light ? AppColors.bgBlueLight : AppColors.bgBlueDark;

  Color? get customContentBlueBg => brightness == Brightness.light ? AppColors.bgContentBlueLight : AppColors.bgContentBlueDark;

  Color? get customPurpleBg => brightness == Brightness.light ? AppColors.bgPurpleLight : AppColors.bgPurpleDark;

  Color? get customContentPurpleBg => brightness == Brightness.light ? AppColors.bgPurpleContentLight : AppColors.bgPurpleContentDark;

}