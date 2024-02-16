import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isDarkMode ? Color(0xff1F2C34) : TColors.pineGreen,
        title: Text(
          'WhatsApp',
          style: kTextStyleHelveticaRegular.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: TColors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.camera_enhance_rounded,
            size: 20.h,
            color: TColors.white,
          ),
          SizedBox(width: 16.h),
          Icon(
            Icons.search,
            size: 20.h,
            color: TColors.white,
          ),
          PopupMenuButton(
            iconColor: TColors.white,
            color: isDarkMode ? TColors.blackBg : TColors.white,
            shadowColor: TColors.greyBg,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'option1',
                  child: Text(
                    'New group',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'New broadcast',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Linked devices',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Starred message',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Payments',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Settings',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
