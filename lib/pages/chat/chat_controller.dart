import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:whatsapp_clone/pages/phone_number/phone_number_controller.dart';

class ChatScreenController extends GetxController {
  final GlobalKey<FormState> messageForm = GlobalKey<FormState>();
  final messageController = TextEditingController();
  var isTextEntered = false.obs;
  final String senderNumber =
      PhoneNumberScreenController.phoneNumber ?? "9029776020";

  String reciverNumber = "8850255428";

  late WebSocketChannel channel;
  RxBool isSent = false.obs;
  final RxList<Map<String, dynamic>> messagesList =
      <Map<String, dynamic>>[].obs;

  var now = DateTime.now();
  var formattedTime;

  @override
  void onInit() {
    // TODO: implement onInit
    print(senderNumber);
    super.onInit();
    formattedTime = DateFormat('hh:mm a').format(now);
    channel = IOWebSocketChannel.connect(
        'wss://85dc-103-106-137-93.ngrok-free.app/v1.0/chat/$senderNumber');
    // channel.stream.listen((message) {
    //   messages.add(message);
    // });
    channel.stream.listen(
      (message) {
        messagesList.add({
          "message": message.toString(),
          "flag": false,
          "time": formattedTime,
        });
        print('Received: $message');
      },
      onError: (error) {
        print('Error: $error');
        // Handle error here
      },
      onDone: () {
        print('WebSocket channel closed');
        // Handle channel closure here
      },
    );
  }

  void sendMessage() {
    print("Message in process");
    if (messageController.text.isNotEmpty) {
      messagesList.add({
        "message": messageController.text.toString(),
        "flag": true,
        "time": formattedTime,
      });
      print("message is sent");

      if (senderNumber == "8850255428") {
        reciverNumber = "9029776020";
      }

      print("here is your number: ${reciverNumber}");
      String jsonString = jsonEncode({
        "text": messageController.text.toString(),
        "to": int.parse(reciverNumber)
      });

      // Send the JSON string to the server
      channel.sink.add(jsonString);
      messageController.clear();
    }
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }
}
