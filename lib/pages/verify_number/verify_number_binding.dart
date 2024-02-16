import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/verify_number/verify_number_controller.dart';

class VerifyNumberScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyNumberController());
  }
}
