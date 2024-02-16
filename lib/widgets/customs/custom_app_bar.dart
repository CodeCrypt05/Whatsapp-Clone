import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.headingText,
    required this.getBack,
  });
  final String headingText;
  final VoidCallback getBack;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xff1F2C34) : TColors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: InkWell(
                    onTap: getBack,
                    child: Container(
                      width: 44.h,
                      height: 44.h,
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        size: 18.h,
                      )),
                    ),
                  ),
                ),
                Text(
                  headingText,
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 16.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
