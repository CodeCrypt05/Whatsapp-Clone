import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/custom_themes/appbar_theme.dart';
import 'package:whatsapp_clone/utils/theme/custom_themes/text_theme.dart';

class TAppTeme {
  TAppTeme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'helvetica-regular',
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'helvetica-regular',
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.blackBg,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
  );
}
