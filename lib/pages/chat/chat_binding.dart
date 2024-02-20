import 'package:get/get.dart';
import 'package:whatsapp_clone/pages/chat/chat_controller.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChatScreenController(),
    );
  }
}
