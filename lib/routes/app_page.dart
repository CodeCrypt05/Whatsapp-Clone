import 'package:get/route_manager.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_binding.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_screen.dart';
import 'package:whatsapp_clone/pages/chat/chat_binding.dart';
import 'package:whatsapp_clone/pages/chat/chat_screen.dart';
import 'package:whatsapp_clone/pages/country_code/country_code_binding.dart';
import 'package:whatsapp_clone/pages/country_code/country_code_screen.dart';
import 'package:whatsapp_clone/pages/home/home_binding.dart';
import 'package:whatsapp_clone/pages/home/home_screen.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_binding.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_screen.dart';
import 'package:whatsapp_clone/pages/phone_number/phone_number_binding.dart';
import 'package:whatsapp_clone/pages/phone_number/phone_number_screen.dart';
import 'package:whatsapp_clone/pages/profile/profile_binding.dart';
import 'package:whatsapp_clone/pages/profile/profile_screen.dart';
import 'package:whatsapp_clone/pages/select_contact/select_contact_binding.dart';
import 'package:whatsapp_clone/pages/select_contact/select_contact_screen.dart';
import 'package:whatsapp_clone/pages/splash/splash_binding.dart';
import 'package:whatsapp_clone/pages/splash/splash_screen.dart';
import 'package:whatsapp_clone/pages/verify_number/verify_number_binding.dart';
import 'package:whatsapp_clone/pages/verify_number/verify_number_screen.dart';
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
    GetPage(
      name: AppRoutes.phoneNumberScreen,
      page: () => const PhoneNumberScreen(),
      binding: PhoneNumberScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.countryCodeScreen,
      page: () => const CountryCodeScreen(),
      binding: CountryCodeScreenBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.verifyNumberScreen,
      page: () => const VerifyNumberScreen(),
      binding: VerifyNumberScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.selectContactScreen,
      page: () => const SelectContactScreen(),
      binding: SelectContactBinding(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileScreenBinding(),
    ),

    // -- Tab routes
    GetPage(
      name: AppRoutes.feedScreen,
      page: () => const FeedScreen(),
      binding: FeedScreenBinding(),
    ),
  ];
}
