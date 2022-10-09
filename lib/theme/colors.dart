import 'package:flutter/material.dart';

class AppColors {

  //light mode colors
  static const primaryColorLight = Color(0xFFFFFFFF);
  static const shadeGreyLight = Color(0xFFf6F5F8);
  static const bgGreyLight = Color(0xFFA1A1A1);
  static const bgShadeBrownLight = Color(0xFFFEF0E4);
  static const bgContentBrownLight = Color(0xFFfd6a22);


  //dark mode colors
  static const primaryColorDark = Color(0xFF302b53);
  static const shadeGreyDark = Color(0x80302B53);
  static const bgGreyDark = Color(0xFFDDDDDD);
  static const bgShadeBrownDark = Color(0xFFbb8b7f);
  static const bgContentBrownDark = Color(0xFFfd6a22);

}

extension CustomColorSchemeX on ColorScheme {

  Color? get customGreyBg => brightness == Brightness.light ? AppColors.shadeGreyLight : AppColors.shadeGreyDark;

  Color? get customContentInGreyBg => brightness == Brightness.light ? AppColors.bgGreyLight : AppColors.bgGreyDark;

  Color? get customBrownBg => brightness == Brightness.light ? AppColors.bgShadeBrownLight : AppColors.bgShadeBrownDark;

  Color? get customContentBrownBg => brightness == Brightness.light ? AppColors.bgContentBrownLight : AppColors.bgContentBrownDark;

}