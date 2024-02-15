import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var isClicked = false.obs;
  var isVisible = false.obs;

  void setSelectedIndex(var index) {
    selectedIndex.value = index;
  }
}
