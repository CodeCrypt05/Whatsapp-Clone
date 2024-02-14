import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/const/const.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_controller.dart';
import 'package:whatsapp_clone/theme/colors.dart';
import 'package:whatsapp_clone/theme/text_style.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  static final List<Map<String, String>> languagesList = [
    {'English': '(device;s language)'},
    {'हिंदी': 'Hindi'},
    {'मराठी': 'Marathi'},
    {'ગુજરાતી': 'Gujarati'},
    {'தமிழ்': 'Tamil'},
    {'తెలుగు': 'Telugu'},
    {'ಕನ್ನಡ': 'Kannada'},
    {'മലയാളം': 'Malayalam'},
    {'ਪੰਜਾਬੀ': 'Punjabi'},
    {'Español': 'Spanish'},
    {'中文': 'Chinese (Mandarin)'},
    {'العربية': 'Arabic'},
    {'Português': 'Portuguese'},
    {'Bengali': 'Bengali'},
    {'Pусский': 'Russian'},
    {'فارسی': 'Persian'},
    {'Deutsch': 'German'},
    {'日本語': 'Japanese'},
    {'한국어': 'Korean'},
    {'Français': 'French'},
    {'Italiano': 'Italian'},
    {'Türkçe': 'Turkish'},
    {'ไทย': 'Thai'},
    {'Tiếng Việt': 'Vietnamese'},
    {'Nederlands': 'Dutch'},
    {'Svenska': 'Swedish'}
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final onBoardingController = Get.find<OnboardingScreenController>();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 64.h),
              child: SvgPicture.asset(
                Const.welcomeLogo,
                fit: BoxFit.cover,
                height: 280.h,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [
                        vBackgroundColor, // bottom color
                        vBackgroundColor.withOpacity(0),
                      ]
                    : [
                        kColorWhite,
                        kColorWhite.withOpacity(0),
                      ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.70, 1.0], // adjust the stop points
              ),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: 184.h),
                Text(
                  "Welcome to WhatsApp",
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Choose your language to get started",
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification &&
                          scrollNotification.metrics.pixels > 0) {
                        final double maxOpacityDistance = 10.0;
                        double opacity = 1.0 -
                            (scrollNotification.metrics.pixels /
                                maxOpacityDistance);
                        opacity = opacity.clamp(
                            0.0, 1.0); // Ensure opacity is within valid range
                        onBoardingController.setOpacity(opacity);
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: languagesList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => ListTile(
                            leading: Radio(
                              value: index,
                              groupValue:
                                  onBoardingController.selectedIndex.value,
                              onChanged: (value) =>
                                  onBoardingController.setSelectedIndex(value),
                            ),
                            title: Text(
                              languagesList[index].keys.first,
                              style: kTextStyleHelveticaRegular.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            subtitle: Text(
                              languagesList[index].values.first,
                              style: kTextStyleHelveticaRegular.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
