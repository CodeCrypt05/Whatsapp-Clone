import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/country_code/country_code_controller.dart';

class CountryCodeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryCodeScreenController());
  }
}
