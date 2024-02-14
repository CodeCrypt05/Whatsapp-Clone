import 'package:get/route_manager.dart';
import 'package:whatsapp_clone/pages/home/home_binding.dart';
import 'package:whatsapp_clone/pages/home/home_screen.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_binding.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_screen.dart';
import 'package:whatsapp_clone/pages/splash/splash_binding.dart';
import 'package:whatsapp_clone/pages/splash/splash_screen.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => OnboardingScreen(),
      binding: OnboardingScreenBinding(),
    ),
  ];
}
