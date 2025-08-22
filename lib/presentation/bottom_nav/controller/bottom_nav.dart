import 'package:get/get.dart';

class BottomBarController extends GetxController {
  var currentIndex = 1.obs;

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
