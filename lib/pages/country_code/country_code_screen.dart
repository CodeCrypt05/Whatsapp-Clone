import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/data/country_code_list.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';

class CountryCodeScreen extends StatelessWidget {
  const CountryCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xff1F2C34) : TColors.white,
        scrolledUnderElevation: 0.0,
        title: Text(
          'Choose a country',
          style: kTextStyleHelveticaRegular.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppBar(
            //   headingText: 'Choose a country',
            //   getBack: () => Get.back(),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 0),
                child: ListView.builder(
                  itemCount: country.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 8.h, 24.w, 8.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                country[index].flag,
                                fit: BoxFit.cover,
                                height: 20.h,
                                width: 50.h,
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Expanded(
                                child: Text(
                                  country[index].name.toString(),
                                  style: kTextStyleHelveticaRegular.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                              Text(
                                country[index].code.toString(),
                                style: kTextStyleHelveticaRegular.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: TColors.darkGray,
                            thickness: 0.1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
