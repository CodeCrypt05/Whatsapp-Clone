import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/components/tabs/calls/calls_screen.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_screen.dart';
import 'package:whatsapp_clone/components/tabs/updates/updates_screen.dart';
import 'package:whatsapp_clone/pages/home/home_controller.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/constants/image_strings.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final homeController = Get.find<HomeScreenController>();
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    tabController?.addListener(_getActiveTabIndex);
  }

  void _getActiveTabIndex() {
    homeController.selectedIndex.value = tabController!.index;
    debugPrint('CURRENT_PAGE ${homeController.selectedIndex.toString()}');
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isDarkMode ? Color(0xff1F2C34) : TColors.pineGreen,
        title: Text(
          'WhatsApp',
          style: kTextStyleHelveticaRegular.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: TColors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.camera_enhance_rounded,
            size: 20.h,
            color: TColors.white,
          ),
          SizedBox(width: 16.h),
          Icon(
            Icons.search,
            size: 20.h,
            color: TColors.white,
          ),
          PopupMenuButton(
            iconColor: TColors.white,
            color: isDarkMode ? TColors.blackBg : TColors.white,
            shadowColor: TColors.greyBg,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'option1',
                  child: Text(
                    'New group',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'New broadcast',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Linked devices',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Starred message',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Payments',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Settings',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          onTap: (tabIndex) {
            homeController.selectedIndex.value = tabIndex;
          },
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor:
              MaterialStateProperty.all<Color>(TColors.white.withOpacity(0.1)),
          tabs: [
            Tab(
              icon: Text(
                "Chats",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Tab(
              icon: Text(
                "Updates",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Tab(
              icon: Text(
                "Calls",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          FeedScreen(),
          UpdateScreen(isDark: isDarkMode),
          CallScreen(),
        ],
      ),
      floatingActionButton: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            homeController.selectedIndex.toInt() == 1
                ? FloatingActionButton(
                    heroTag: 'EditStatus',
                    onPressed: () {},
                    mini: true,
                    backgroundColor:
                        isDarkMode ? TColors.primary : TColors.pineGreen,
                    child: Icon(
                      Icons.edit,
                      size: 24.h,
                      color: isDarkMode ? TColors.blackBg : TColors.whiteBg,
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 12.h),
            FloatingActionButton(
              heroTag: "FloatingButton1",
              onPressed: () {
                if (homeController.selectedIndex.toInt() == 0) {
                  Get.toNamed(AppRoutes.selectContactScreen);
                } else if (homeController.selectedIndex.toInt() == 1) {
                } else if (homeController.selectedIndex.toInt() == 2) {}
              },
              backgroundColor: isDarkMode ? TColors.primary : TColors.pineGreen,
              child: homeController.selectedIndex.toInt() == 0
                  ? RotatedBox(
                      quarterTurns: 0,
                      child: Icon(
                        Icons.message,
                        size: 24.h,
                        color: isDarkMode ? TColors.blackBg : TColors.whiteBg,
                      ),
                    )
                  : homeController.selectedIndex.toInt() == 1
                      ? Icon(
                          Icons.camera_alt,
                          size: 24.h,
                          color: isDarkMode ? TColors.blackBg : TColors.whiteBg,
                        )
                      : Icon(
                          Icons.add_call,
                          size: 24.h,
                          color: isDarkMode ? TColors.blackBg : TColors.whiteBg,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
