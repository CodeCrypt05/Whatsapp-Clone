import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/customs/customButton.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});

  // Bottom Sheet

  void showModelBottomSheet(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? TColors.blackBg : TColors.white,
      builder: (context) {
        return Container(
          height: 320.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 16.h),
                alignment: Alignment.topLeft,
                child: Icon(Icons.close),
              ),
              const CircleAvatar(
                radius: 28,
                backgroundColor: TColors.primary,
                child: Icon(
                  Icons.message,
                  color: TColors.white,
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Didn't receive a verification code?",
                        textAlign: TextAlign.center,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Please check your SMS message before requesting another code.",
                        textAlign: TextAlign.center,
                        style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.messenger,
                      color: Colors.grey,
                      size: 16.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Resend SMS',
                      style: kTextStyleHelveticaLight.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 36.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    )),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.call,
                      color: TColors.primary,
                      size: 16.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Call me',
                      style: kTextStyleHelveticaLight.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: TColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Verifying your number',
          style: kTextStyleHelveticaLight.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? TColors.white : TColors.pineGreen,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: isDarkMode ? TColors.blackBg : TColors.white,
            shadowColor: TColors.greyBg,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'option1',
                  child: Text(
                    'Link as companion device',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Help',
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
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: "Waiting to automatically detect an SMS sent to ",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
                children: [
                  TextSpan(
                    text: "+91 96544 44533. ",
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ), // Change the color of this text
                  ),
                  const TextSpan(
                    text: "Wrong number?",
                    style: TextStyle(
                        color: Colors.blue), // Change the color of this text
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: TextFormField(
                      cursorColor: TColors.primary,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      decoration: InputDecoration(
                        hintText: "– – –   – – –",
                        hintStyle: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                      ),
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Divider(
                    color: TColors.primary,
                    height: 1.8,
                    thickness: 1.6,
                  )
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              'Enter 6-digit code',
              textAlign: TextAlign.center,
              style: kTextStyleHelveticaRegular.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () => showModelBottomSheet(context, isDarkMode),
              child: Text(
                "Didn't recive code?",
                textAlign: TextAlign.center,
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'You may request a new code in 0:49',
              textAlign: TextAlign.center,
              style: kTextStyleHelveticaRegular.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                width: 60.w,
                padding: EdgeInsets.only(bottom: 20.h),
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.homeScreen),
                  child: CustomButton(
                    label: "Next",
                    isDarkMode: isDarkMode,
                    radius: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
