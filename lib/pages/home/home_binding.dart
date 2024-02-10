import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
