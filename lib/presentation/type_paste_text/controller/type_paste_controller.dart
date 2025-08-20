import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypePasteController extends GetxController {
  final textController = TextEditingController();
  RxString typedText = "".obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      typedText.value = textController.text;
    });
  }

  void listenText() {
    if (typedText.value.isNotEmpty) {
      Get.snackbar("Listen", "Listening: ${typedText.value}",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Empty", "Please enter some text",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
