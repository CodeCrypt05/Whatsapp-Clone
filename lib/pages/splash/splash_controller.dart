import 'package:get/get.dart';
import 'package:whatsapp_clone/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.onboardingScreen);
    });
  }
}
