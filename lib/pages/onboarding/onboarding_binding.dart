import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/onboarding/onboarding_controller.dart';

class OnboardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenController());
  }
}
