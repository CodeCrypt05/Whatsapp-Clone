import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/channel_list.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PopupMenuButton(
                  offset: Offset(0, 40),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text('Status privacy'),
                      value: 'item1',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
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
                      top: 32,
                      left: 32,
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: TColors.primary,
                            borderRadius: BorderRadius.circular(60.r),
                            border: Border.all(
                                color: isDark ? TColors.blackBg : TColors.white,
                                width: 1.4)),
                        child: Icon(
                          Icons.add,
                          color: TColors.white,
                          size: 18.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 14.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "My status",
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Tap to add status update",
                      style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 18.h),
          const Divider(thickness: 0.4),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Channels",
                  style: kTextStyleHelveticaRegular.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PopupMenuButton(
                  icon: Icon(Icons.add),
                  offset: Offset(0, 40),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text('Create channel'),
                      value: 'item1',
                    ),
                    const PopupMenuItem(
                      child: Text('Find channel'),
                      value: 'item1',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Stay updated on topics that matter to you. Find channels to follow below.",
              style: kTextStyleHelveticaRegular.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            // color: Colors.green,
            padding: EdgeInsets.only(left: 16.w),
            width: double.infinity,
            height: 140.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ChannelList(
                    isDark: isDark,
                  );
                }),
          )
        ],
      ),
    );
  }
}
