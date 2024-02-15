import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_controller.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/language_list_tile.dart';

class ExpandableBottomSheet extends StatelessWidget {
  final OnboardingScreenController onBoardingController;
  final bool isDarkMode;

  const ExpandableBottomSheet(
      {super.key,
      required this.onBoardingController,
      required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDarkMode ? TColors.greyBg : TColors.whiteBg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        size: 18.h,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 12.h),
                    Text(
                      'App language ',
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: TColors.darkGray,
                thickness: 0.1,
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: LanguageListTile.languagesList.length,
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
        );
      },
    );
  }
}
