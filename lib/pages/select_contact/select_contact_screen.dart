import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/data/feed_data_list.dart';
import 'package:whatsapp_clone/pages/home/home_controller.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/customs/common_app_bar.dart';
import 'package:whatsapp_clone/widgets/feed_tile.dart';

class SelectContactScreen extends StatelessWidget {
  SelectContactScreen({super.key});

  final homeController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Select contact",
        getBack: () => Get.back(),
        icons: const [Icons.search],
      ),
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
                      Icons.group,
                      color: TColors.white,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "New group",
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
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
                      Icons.person_add,
                      color: TColors.white,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "New contact",
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
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
                      Icons.groups_2,
                      color: TColors.white,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "New community",
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              SizedBox(height: 8.h),
              Text(
                "Contacts on WhatsApp",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.verifiedContactDetailsList.length,
                itemBuilder: (context, index) {
                  // List sortedData = feedData;
                  // sortedData.sort((a, b) => a.name.compareTo(b.name));

                  final profile =
                      homeController.verifiedContactDetailsList[index].avatar;
                  final name = homeController
                      .verifiedContactDetailsList[index].displayName;
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.chatScreen, arguments: index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: FeedTile(
                        profilePic: profile!,
                        name: name.toString(),
                        status: "data sent",
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 8.h),
              Text(
                "Contacts on",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.contactDetailsList.length,
                itemBuilder: (context, index) {
                  // List sortedData = feedData;
                  // sortedData.sort((a, b) => a.name.compareTo(b.name));
                  // final profile = homeController.contactsList[index].;

                  final profile =
                      homeController.contactDetailsList[index].avatar;
                  final name =
                      homeController.contactDetailsList[index].displayName;
                  print(
                      "length to display ${homeController.contactDetailsList.length}");
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.chatScreen, arguments: index);
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: FeedTile(
                        profilePic: profile!,
                        name: name.toString(),
                        status: "hii jesus",
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
