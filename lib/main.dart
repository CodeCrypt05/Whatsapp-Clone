import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone/pages/home/home_screen.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_binding.dart';
import 'package:whatsapp_clone/pages/splash/splash_binding.dart';
import 'package:whatsapp_clone/routes/app_page.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';
import 'package:whatsapp_clone/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.onboardingScreen,
        getPages: AppPages.getPages,
        initialBinding: OnboardingScreenBinding(),
        themeMode: ThemeMode.system,
        theme: TAppTeme.lightTheme,
        darkTheme: TAppTeme.darkTheme,
  
      ),
    );
  }
}
