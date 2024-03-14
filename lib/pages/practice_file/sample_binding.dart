import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/practice_file/sample_controller.dart';

class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SampleController());
  }
}
