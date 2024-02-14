import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/splash/splash_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
  
}