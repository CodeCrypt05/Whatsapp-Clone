import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/data/calls_data_list.dart';
import 'package:whatsapp_clone/data/feed_data_list.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';

import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/call_tile.dart';
import 'package:whatsapp_clone/widgets/feed_tile.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.circular(50.r)),
                    child: const Icon(
                      Icons.link,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create call link",
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Share a link for your WhatsApp call",
                        style: kTextStyleHelveticaRegular.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                "Recent",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: callsData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.chatScreen, arguments: index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: CallTile(
                        profilePic: callsData[index].profilePic,
                        name: callsData[index].name,
                        misCalls: callsData[index].date,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
