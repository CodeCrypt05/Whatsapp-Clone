import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  final GlobalKey<FormState> messageForm = GlobalKey<FormState>();
  final messageController = TextEditingController();
  var isTextEntered = false.obs;

  // -- Message list
  final messageList = [].obs;

  void sendMessage() {
    messageList.add(messageController.text);
    print(messageList);
    messageController.clear();
    isTextEntered.value = false;
  }
}
