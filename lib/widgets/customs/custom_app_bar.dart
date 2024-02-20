import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  const CustomAppBar({
    super.key,
    required this.title,
    required this.getBack,
    this.profilePics,
  });
  final String title;
  final VoidCallback getBack;
  final String? profilePics;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xff1F2C34) : TColors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: getBack,
                  child: Container(
                    // color: Colors.red,
                    width: 36.h,
                    height: 44.h,
                    child: Center(
                        child: Icon(
                      Icons.arrow_back,
                      size: 18.h,
                    )),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  child: profilePics == null
                      ? SizedBox.shrink()
                      : CircleAvatar(
                          radius: 18.r,
                          backgroundImage: AssetImage(profilePics!),
                        ),
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


}
