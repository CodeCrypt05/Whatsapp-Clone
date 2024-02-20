import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class TTabBarTheme {
  // -- Light Theme
  static TabBarTheme lightTabBarTheme = const TabBarTheme(
    indicatorColor: TColors.white,
    dividerColor: Colors.transparent,
    labelColor: TColors.white,
    unselectedLabelColor: Colors.grey,
  );

  // -- Dark Theme
  static TabBarTheme darkTabBarTheme = const TabBarTheme(
    indicatorColor: TColors.primary,
    dividerColor: Colors.transparent,
    labelColor: TColors.primary,
    unselectedLabelColor: Colors.grey,
  );
}
