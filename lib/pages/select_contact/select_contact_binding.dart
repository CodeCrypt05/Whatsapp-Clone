import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/select_contact/select_contact_controller.dart';

class SelectContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectContactScreenController());
  }
  
}
