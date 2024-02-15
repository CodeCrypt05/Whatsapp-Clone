import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter your phone number',
          style: kTextStyleHelveticaLight.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? TColors.white : TColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Text(
              "WhatsApp will nedd to verify your account. Whtat's my number?",
              textAlign: TextAlign.center,
              style: kTextStyleHelveticaRegular.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
