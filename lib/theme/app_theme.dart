import 'package:flutter/material.dart';
import 'package:whatsapp_clone/theme/colors.dart';
import 'package:whatsapp_clone/theme/custom_themes/text_theme.dart';

class TAppTeme {
  TAppTeme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'helvetica-regular',
    primaryColor: kColorPrimary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'helvetica-regular',
    primaryColor: kColorPrimary,
    scaffoldBackgroundColor: vBackgroundColor,
    textTheme: TTextTheme.darkTextTheme,
  );
}
