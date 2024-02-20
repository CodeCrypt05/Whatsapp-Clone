import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    super.key,
    required this.profilePic,
    required this.name,
    this.date,
    required this.status,
  });

  final String profilePic;
  final String name;
  final String status;
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
                  status.toString(),
                  textAlign: TextAlign.left,
                  style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
