import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberScreenController extends GetxController {
  GlobalKey<FormState> numberForm = GlobalKey<FormState>();

  final phoneNumberControllerText = TextEditingController();
  static String? phoneNumber;

  void printNumber() {
    print(phoneNumberControllerText.text.toString());
    phoneNumber = phoneNumberControllerText.text.toString();
  }
}
