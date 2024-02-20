import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CallTile extends StatelessWidget {
  const CallTile({
    super.key,
    required this.profilePic,
    required this.name,
    this.date,
    this.misCalls,
  });

  final String profilePic;
  final String name;
  final String? misCalls;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage(profilePic),
        ),
        // Title
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name.toString(),
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    date == null
                        ? SizedBox.shrink()
                        : Text(
                            date.toString(),
                            style: kTextStyleHelveticaRegular.copyWith(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                  ],
                ),
                Text(
                  misCalls.toString(),
                  textAlign: TextAlign.left,
                  style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        ),

        // icon
        const Icon(
          Icons.call,
          color: TColors.primary,
        ),
      ],
    );
  }
}
