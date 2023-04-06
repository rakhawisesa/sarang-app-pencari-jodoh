import 'package:flutter/material.dart';
import 'package:sarang/src/theme_manager/color_manager.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';

/*
  Digunakan untuk mengubah background color secara keseluruhan, dalam
  artian ketika memanggil "Scaffold"
*/
ThemeData getApplicationThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primary,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstant.fontFamily,
  );
}
