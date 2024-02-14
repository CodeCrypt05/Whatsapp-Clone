import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {
  var selectedIndex = 0.obs;
  RxDouble opacity = 1.0.obs;

  void setOpacity(double value) {
    opacity.value = value;
  }

  void setSelectedIndex(var index) {
    selectedIndex.value = index;
  }
}
