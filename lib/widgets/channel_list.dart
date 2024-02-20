import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class ChannelList extends StatelessWidget {
  const ChannelList({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 100.w,
      margin: EdgeInsets.only(right: 10.h),
      decoration: BoxDecoration(
        // color: Colors.pinkAccent,
        border: Border.all(
          color: TColors.darkGray,
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Stack(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.r),
                  image: const DecorationImage(
                    image: AssetImage(
                      TImages.profile2,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 32,
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(60.r),
                      border: Border.all(color: TColors.white, width: 1.4)),
                  child: Icon(
                    Icons.add,
                    color: TColors.white,
                    size: 18.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "WhatsApp",
            style: kTextStyleHelveticaRegular.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 24.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: TColors.primary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(60.r),
            ),
            alignment: Alignment.center,
            child: Text(
              "Follow",
              style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? TColors.white.withOpacity(0.7)
                      : TColors.pineGreen),
            ),
          )
        ],
      ),
    );
  }
}
