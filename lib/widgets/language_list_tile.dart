import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_controller.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({
    super.key,
    required this.onBoardingController,
    required this.index,
  });

  final OnboardingScreenController onBoardingController;
  final int index;

  static final List<Map<String, String>> languagesList = [
    {'English': "(device's language)"},
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
    return Obx(
      () => ListTile(
        leading: Radio(
          activeColor: TColors.primary,
          value: index,
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TColors.primary;
            } else {
              return Colors.grey;
            }
          }),
          groupValue: onBoardingController.selectedIndex.value,
          onChanged: (value) => onBoardingController.setSelectedIndex(value),
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
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
