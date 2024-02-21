import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/utils/constants/colors.dart';
import 'package:whatsapp_clone/utils/theme/text_style.dart';
import 'package:whatsapp_clone/widgets/customs/customButton.dart';
import 'package:whatsapp_clone/widgets/customs/customTextField.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Enter your phone number',
          style: kTextStyleHelveticaLight.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? TColors.white : TColors.pineGreen,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: isDarkMode ? TColors.blackBg : TColors.white,
            shadowColor: TColors.greyBg,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'option1',
                  child: Text(
                    'Link as companion device',
                    style: kTextStyleHelveticaRegular.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text(
                    'Help',
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
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: "WhatsApp will need to verify your account. ",
                style: kTextStyleHelveticaRegular.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w200,
                ),
                children: const [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(
                        color: Colors.blue), // Change the color of this text
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.countryCodeScreen),
              child: Container(
                width: 240.w,
                height: 26.h,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: TColors.primary,
                      width: 0.6,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'India',
                        textAlign: TextAlign.center,
                        style: kTextStyleHelveticaRegular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: TColors.primary,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 240.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 52.w,
                    child: CustomTextfieldWidget(
                      initialValue: "91",
                      textInputType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      textAlignVertical: TextAlignVertical.bottom,
                      prefixIcon: Container(
                        width: 24.w,
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.add,
                          size: 14.h,
                          color: Colors.grey,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 0,
                      ),
                      hintStyle: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextfieldWidget(
                      textInputType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(18)],
                      hintText: "phone number",
                      hintStyle: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      style: kTextStyleHelveticaRegular.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              'International carrier charges may apply',
              textAlign: TextAlign.center,
              style: kTextStyleHelveticaRegular.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                width: 60.w,
                padding: EdgeInsets.only(bottom: 20.h),
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.verifyNumberScreen),
                  child: CustomButton(
                    label: "Next",
                    isDarkMode: isDarkMode,
                    radius: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
