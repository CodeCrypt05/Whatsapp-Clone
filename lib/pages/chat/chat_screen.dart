import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/data/feed_data_list.dart';
import 'package:whatsapp_clone/pages/chat/chat_controller.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/customs/common_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // -- Date format
    var now = DateTime.now();
    var formattedTime = DateFormat('hh:mm a').format(now);

    // -- Calling controller
    final chatScreenController = Get.find<ChatScreenController>();

    // -- Checking local device is Dark
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    // -- Getting data from navigator screen
    final index = Get.arguments;
    final profilePic = feedData[index].profilePic;
    final name = feedData[index].name;
    print("get index : ${index}");

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xff0A1B23) : Color(0xffE5DDD5),
      appBar: CommonAppBar(
        title: name,
        getBack: () => Get.back(),
        profilePics: profilePic,
        icons: const [Icons.videocam, Icons.call],
        onClick: () {
          Get.toNamed(AppRoutes.profileScreen);
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => Form(
                key: chatScreenController.messageForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: chatScreenController.messageList.length,
                        itemBuilder: (context, index) {
                          final reversedIndex =
                              chatScreenController.messageList.length -
                                  1 -
                                  index;
                          return Container(
                            width: double.minPositive,
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.fromLTRB(14.w, 0.h, 14.h, 0.h),
                            // color: Colors.blue,
                            child: Container(
                              //
                              decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? TColors.pineGreen
                                      : Color(0xffE7ffdb),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // color: Colors.blueAccent,
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      chatScreenController
                                          .messageList[reversedIndex],
                                      style:
                                          kTextStyleHelveticaRegular.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: isDarkMode
                                            ? TColors.white
                                            : TColors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4.h),
                                    alignment: Alignment.bottomCenter,
                                    // color: Colors.redAccent,
                                    child: Text(
                                      formattedTime,
                                      style:
                                          kTextStyleHelveticaRegular.copyWith(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade700),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 6.w, bottom: 6.h),
                                    alignment: Alignment.bottomCenter,
                                    // color: Colors.redAccent,
                                    child: Icon(
                                      Icons.check,
                                      size: 14.h,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // -- Textfield to type messages
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
                            decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Color(0xFF1F2C34)
                                    : TColors.white,
                                borderRadius: BorderRadius.circular(40)),
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFormField(
                              maxLines: null,
                              controller:
                                  chatScreenController.messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 8.h),
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
                                    chatScreenController.isTextEntered.value
                                        ? SizedBox.shrink()
                                        : Row(
                                            children: [
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
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  chatScreenController.isTextEntered.value =
                                      true;
                                } else {
                                  chatScreenController.isTextEntered.value =
                                      false;
                                }
                              },
                            ),
                          ),
                        ),
                        // Send message button
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              chatScreenController.sendMessage();
                            },
                            child: Container(
                              height: 42.h,
                              width: 42.w,
                              margin: EdgeInsets.fromLTRB(0, 0, 8.w, 12.h),
                              decoration: BoxDecoration(
                                color: TColors.primary,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: chatScreenController.isTextEntered.value
                                  ? const Icon(
                                      Icons.send,
                                      color: TColors.white,
                                    )
                                  : const Icon(
                                      Icons.mic,
                                      color: TColors.white,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
