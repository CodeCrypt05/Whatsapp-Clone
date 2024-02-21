import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/profile/profile_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}
