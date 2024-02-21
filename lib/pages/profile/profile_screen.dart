import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 44.r,
                        backgroundImage: AssetImage(TImages.profile6),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Abhishek Waghre',
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? TColors.white : TColors.black,
                        ),
                      ),
                      Text(
                        '+91 88463 36464',
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 18.h),
                  // -- row 4 tabs
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 68.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 22.h,
                                  color: TColors.primary,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Audio",
                                  style: kTextStyleHelveticaRegular.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 68.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.videocam_rounded,
                                  size: 22.h,
                                  color: TColors.primary,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Video",
                                  style: kTextStyleHelveticaRegular.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 68.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.paypal_rounded,
                                  size: 22.h,
                                  color: TColors.primary,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Pay",
                                  style: kTextStyleHelveticaRegular.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 68.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 22.h,
                                  color: TColors.primary,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Search",
                                  style: kTextStyleHelveticaRegular.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //----- Status

                  // SizedBox(height: 28.h),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 14.w),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Manifest :)",
                  //         style: kTextStyleHelveticaRegular.copyWith(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //       Text(
                  //         "30 January",
                  //         style: kTextStyleHelveticaRegular.copyWith(
                  //           fontSize: 12.sp,
                  //           fontWeight: FontWeight.w400,
                  //           color: Colors.grey,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
