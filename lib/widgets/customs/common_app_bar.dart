import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    required this.getBack,
    this.profilePics,
    required this.icons,
  });

  final String title;
  final VoidCallback getBack;
  final String? profilePics;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      color: isDarkMode ? Color(0xff1F2C34) : TColors.pineGreen,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 25 / 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: getBack,
                        child: Container(
                          // color: Colors.red,
                          width: 36.h,
                          height: 44.h,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            size: 18.h,
                            color: TColors.white,
                          )),
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        child: profilePics == null
                            ? SizedBox.shrink()
                            : Image.asset(
                                profilePics!,
                                fit: BoxFit.cover,
                                height: 90.h,
                              ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        title,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: TColors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 120.w,
                height: 30.h,
                // color: Colors.blueAccent,
                // padding: EdgeInsets.only(right: 10.w),
                alignment: Alignment.bottomRight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        icons[index],
                        size: 24.h,
                        color: TColors.white,
                      ),
                    );
                  },
                ),
              ),
              PopupMenuButton(
                iconColor: TColors.white,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: Text('Item 1'),
                    value: 'item1',
                  ),
                  const PopupMenuItem(
                    child: Text('Item 2'),
                    value: 'item2',
                  ),
                  const PopupMenuItem(
                    child: Text('Item 3'),
                    value: 'item3',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        56.h,
      );
}
