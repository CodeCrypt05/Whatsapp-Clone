import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';

class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  Tween<double>? profilePicTranslateTween;
  ColorTween? appBarColorTween;
  ColorTween? appbarIconColorTween;

  bool isDark;

  WhatsappAppbar(this.screenWidth, this.isDark) {
    profilePicTranslateTween =
        Tween<double>(begin: screenWidth / 2 - 45 - 40 + 15, end: 40.0);

    appBarColorTween = isDark
        ? ColorTween(begin: Color(0xFF121b22), end: const Color(0xff1f2c34))
        : ColorTween(
            begin: Colors.white, end: const Color.fromARGB(255, 4, 94, 84));

    appbarIconColorTween = isDark
        ? ColorTween(begin: Colors.white, end: Colors.white)
        : ColorTween(begin: Colors.grey[800], end: Colors.white);
  }

  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 20.0, end: 18.0);

  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appBarColorTween!
          .transform(relativeScroll), // Change this color to the desired color
    ));
    return Container(
      color: appBarColorTween!.transform(relativeScroll),
      child: Stack(children: [
        Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back, size: 24.h),
                    color: appbarIconColorTween!.transform(relativeScroll),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, size: 25),
                    color: appbarIconColorTween!.transform(relativeScroll),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 90,
                  child: displayPhoneNumber(relativeScroll70px),
                ),
                Positioned(
                    top: 5,
                    left:
                        profilePicTranslateTween!.transform(relativeScroll70px),
                    child: displayProfilePicture(relativeScroll70px)),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: CircleAvatar(
        radius: 16.r,
        backgroundImage: AssetImage(TImages.profile2),
      ),
    );
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.8) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            -phoneNumberTranslateTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            0.0,
          ),
        child: Text(
          "Vaibhav",
          style: TextStyle(
            fontSize: phoneNumberFontSizeTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
