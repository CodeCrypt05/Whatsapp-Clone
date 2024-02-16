import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:whatsapp_clone/pages/phone_number/phone_number_controller.dart';

class PhoneNumberScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneNumberScreenController());
  }
}
