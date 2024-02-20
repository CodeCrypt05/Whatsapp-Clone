import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/data/feed_data_list.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/customs/common_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final index = Get.arguments;
    final profilePic = feedData[index].profilePic;
    final name = feedData[index].name;
    final date = feedData[index].date;
    final status = feedData[index].status;
    return Scaffold(
      appBar: CommonAppBar(
        title: name,
        getBack: () => Get.back(),
        profilePics: profilePic,
        icons: const [Icons.videocam, Icons.call],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              isDarkMode ? TImages.darkBackground : TImages.lightBackground,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40.h,
                        margin: EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                        decoration: BoxDecoration(
                            color:
                                isDarkMode ? Color(0xFF1F2C34) : TColors.white,
                            borderRadius: BorderRadius.circular(40)),
                        padding: EdgeInsets.only(top: 2.h),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 2.h),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 8.w),
                                SvgPicture.asset(
                                  TImages.smileIc,
                                  fit: BoxFit.cover,
                                  height: 24.h,
                                )
                              ],
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  TImages.attachFileIc,
                                  fit: BoxFit.cover,
                                  height: 24.h,
                                ),
                                SizedBox(width: 14.w),
                                SvgPicture.asset(
                                  TImages.paymentIc,
                                  fit: BoxFit.cover,
                                  height: 20.h,
                                ),
                                SizedBox(width: 14.w),
                                SvgPicture.asset(
                                  TImages.cameraIc,
                                  fit: BoxFit.cover,
                                  height: 24.h,
                                ),
                                SizedBox(width: 14.w),
                              ],
                            ),
                            hintText: "Message",
                            hintStyle: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          enableSuggestions: false,
                          cursorColor: TColors.primary,
                        ),
                      ),
                    ),
                    Container(
                      height: 42.h,
                      width: 42.w,
                      margin: EdgeInsets.fromLTRB(0, 0, 8.w, 12.h),
                      decoration: BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: TColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
