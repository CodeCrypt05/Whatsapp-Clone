import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_controller.dart';
import 'package:whatsapp_clone/data/feed_data_list.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/feed_tile.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final feedScreenController = Get.find<FeedScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => feedScreenController.isEmpty.value
          ? Center(
              child: Text(
                "Currently you don't have any feed data",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: feedData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("clicked");
                        Get.toNamed(AppRoutes.chatScreen, arguments: index);
                        print("clicked index: ${index} ");
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 12.h),
                        child: FeedTile(
                          name: feedData[index].name,
                          date: feedData[index].date,
                          status: feedData[index].status,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}


// arguments: [
//                 {"profilePic": feedData[index].profilePic},
//                 {"name": feedData[index].name},
//                 {"data": feedData[index].date},
//                 {"status": feedData[index].status},
//               ]