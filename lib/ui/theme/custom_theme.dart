import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._init();

  static final CustomTheme _instance = CustomTheme._init();
  static CustomTheme get instance => _instance;

  final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorKit.blackColor),
      titleTextStyle: TextStyle(
          color: ColorKit.blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w500),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorKit.greyBackGroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: ColorKit.blackColor),
    ),
  );
}
