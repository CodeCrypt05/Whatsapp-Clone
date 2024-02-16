import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/const/const.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_controller.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/text_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/widgets/language_bottomsheet.dart';
import 'package:whatsapp_clone/widgets/language_list_tile.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final onBoardingController = Get.find<OnboardingScreenController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              // Background image
              AnimatedOpacity(
                opacity: onBoardingController.isClicked.value ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 64.h),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Const.welcomeLogo,
                        fit: BoxFit.cover,
                        height: 280.h,
                      ),
                    ],
                  ),
                ),
              ),

              // Welcome msg with language list
              AnimatedOpacity(
                opacity: onBoardingController.isClicked.value ? 0.0 : 1.0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: isDarkMode
                        ? TColors.kDarkGradientBackgroundColor
                        : TColors.kLightGradientBackgroundColor,
                  ),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 184.h),
                      Text(
                        TTexts.onBoardingTitle1,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        TTexts.onBoardingTitle2,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: LanguageListTile.languagesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LanguageListTile(
                              onBoardingController: onBoardingController,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              AnimatedOpacity(
                opacity: onBoardingController.isClicked.value ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  margin: EdgeInsets.only(top: 68.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 52.h),
                      Text(
                        TTexts.onBoardingTitle1,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Services.',
                          textAlign: TextAlign.center,
                          style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: TColors.lightGray,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => ExpandableBottomSheet(
                              onBoardingController: onBoardingController,
                              isDarkMode: isDarkMode,
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                              color: TColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(24.r)),
                          width: 124.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.language,
                                size: 20.h,
                                color: TColors.primary,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'English',
                                style: kTextStyleHelveticaRegular.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: TColors.primary.withOpacity(0.8),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 20.h,
                                  color: TColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // SizedBox.expand(
              //   child: DraggableScrollableSheet(
              //       initialChildSize: 0.5,
              //       minChildSize: 0.13,
              //       maxChildSize: 0.9,
              //       builder: (context, index) {
              //         return ListView.builder(
              //           padding: EdgeInsets.zero,
              //           itemCount: LanguageListTile.languagesList.length,
              //           shrinkWrap: true,
              //           itemBuilder: (context, index) {
              //             return LanguageListTile(
              //               onBoardingController: onBoardingController,
              //               index: index,
              //             );
              //           },
              //         );
              //       }),
              // ),

              // Next Button
              AnimatedOpacity(
                opacity: onBoardingController.isClicked.value ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    onBoardingController.isClicked.value = true;
                  },
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(right: 20.h, bottom: 20.h),
                    child: Container(
                      height: 54.h,
                      width: 54.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.pineGreen,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          isDarkMode
                              ? const BoxShadow()
                              : const BoxShadow(
                                  color: TColors.lightGray,
                                  blurRadius: 4,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: isDarkMode ? TColors.blackBg : TColors.white,
                        size: 24.h,
                      ),
                    ),
                  ),
                ),
              ),

              // Agree and continue
              AnimatedOpacity(
                opacity: onBoardingController.isClicked.value ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.phoneNumberScreen),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding:
                        EdgeInsets.only(right: 20.w, left: 20.w, bottom: 20.h),
                    child: Container(
                      height: 32.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.pineGreen,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        'Agree and continue',
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? TColors.blackBg : TColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
