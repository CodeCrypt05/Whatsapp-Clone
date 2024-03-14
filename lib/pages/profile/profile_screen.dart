import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/pages/profile/whatsapp_aapbar.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';

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
      backgroundColor: isDarkMode ? Color(0xFF0B141B) : Color(0xFFF7F8FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                delegate: WhatsappAppbar(
                    MediaQuery.of(context).size.width, isDarkMode),
                pinned: true),
            SliverToBoxAdapter(
              child: Container(
                color: isDarkMode ? Color(0xFF121B22) : TColors.white,
                child: Column(
                  children: [
                    SizedBox(height: 18.h),
                    Text(
                      "Abhishek Waghre",
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "+91 88334 33453",
                      style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // const WhatsappProfileBody(),

            // Profile Body

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // --
                  Container(
                    color: isDarkMode ? Color(0xFF121B22) : TColors.white,
                    alignment: Alignment.center,
                    height: 100.h,
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 74.w,
                          margin: EdgeInsets.all(6),
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
                        );
                      },
                    ),
                  ),

                  Container(
                    color: isDarkMode ? Color(0xFF121B22) : TColors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Text(
                          "Hey there! I am using WhatsApp.",
                          style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "30 January",
                          style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),

                  // --

                  SizedBox(height: 8.h),
                  Container(
                    color: isDarkMode ? Color(0xFF121B22) : TColors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: Colors.grey.shade500,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mute Notifications",
                                style: kTextStyleHelveticaRegular.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Switch(
                                activeColor: isDarkMode
                                    ? TColors.blackBg
                                    : TColors.whiteBg,
                                activeTrackColor: TColors.pineGreen,
                                inactiveThumbColor: Colors.grey,
                                inactiveTrackColor: isDarkMode
                                    ? Color(0XFF1F2C34)
                                    : Colors.grey.shade200,
                                value: false,
                                onChanged: (state) {},
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Custom Notifications",
                            style: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          leading: Icon(
                            Icons.music_note,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Media visibility",
                            style: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          leading: Icon(
                            Icons.image,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        // to fill up the rest of the space to enable scrolling
                      ],
                    ),
                  ),

                  // --
                  SizedBox(height: 8.h),
                  Container(
                    color: isDarkMode ? Color(0xFF121B22) : TColors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: Colors.grey.shade500,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Encryption",
                                style: kTextStyleHelveticaRegular.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Messages and calls are end-to-end \nencrypted. Tap to verify.",
                                style: kTextStyleHelveticaRegular.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Disappering messages",
                            style: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          leading: Icon(
                            Icons.timelapse,
                            color: Colors.grey.shade500,
                          ),
                          subtitle: Text(
                            "Off",
                            style: kTextStyleHelveticaRegular.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chat lock",
                                    style: kTextStyleHelveticaRegular.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Lock and hide this chat on this device.",
                                    style: kTextStyleHelveticaRegular.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                activeColor: isDarkMode
                                    ? TColors.blackBg
                                    : TColors.whiteBg,
                                activeTrackColor: TColors.pineGreen,
                                inactiveThumbColor: Colors.grey,
                                inactiveTrackColor: isDarkMode
                                    ? Color(0XFF1F2C34)
                                    : Colors.grey.shade200,
                                value: false,
                                onChanged: (state) {},
                              ),
                            ],
                          ),
                          leading: Icon(
                            Icons.lock_person_rounded,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        // to fill up the rest of the space to enable scrolling
                        SizedBox(height: 550),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
