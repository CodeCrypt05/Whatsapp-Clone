import 'package:get/get.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_controller.dart';
import 'package:whatsapp_clone/pages/home/home_controller.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => FeedScreenController());
  }
}
