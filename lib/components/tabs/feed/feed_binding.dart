import 'package:get/get.dart';
import 'package:whatsapp_clone/components/tabs/feed/feed_controller.dart';

class FeedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedScreenController());
  }
}
