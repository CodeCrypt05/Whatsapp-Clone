import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.isDarkMode,
    this.radius,
  });

  final String label;
  final bool isDarkMode;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: TColors.pineGreen,
        borderRadius: BorderRadius.circular(radius ?? 18.r),
      ),
      child: Text(
        label.toString(),
        style: kTextStyleHelveticaRegular.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: isDarkMode ? TColors.blackBg : TColors.white,
        ),
      ),
    );
  }
}
