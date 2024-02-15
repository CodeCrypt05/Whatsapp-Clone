import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/const/const.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';

import 'package:whatsapp_clone/utils/theme/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final height = MediaQuery.of(context).size.height;

    bool isDarkMode = brightness == Brightness.dark;
    print(isDarkMode);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 0.82 * height,
              width: double.infinity,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Const.whatsappLogo,
                fit: BoxFit.cover,
                height: 76.h,
                color: isDarkMode ? TColors.white : TColors.primary,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 0.18 * height,
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "from",
                      style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Const.metaLogo,
                            fit: BoxFit.cover,
                            height: 16.h,
                            color:
                                isDarkMode ? TColors.white : TColors.primary),
                        SizedBox(width: 4.h),
                        Text(
                          "Meta",
                          style: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color:
                                  isDarkMode ? TColors.white : TColors.primary),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
