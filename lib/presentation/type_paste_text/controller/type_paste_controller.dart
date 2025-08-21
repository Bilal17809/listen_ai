import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypePasteController extends GetxController {
  final textController = TextEditingController();
  RxString typedText = "".obs;

  @override
  void onInit() {
    clearText();
    super.onInit();
    textController.addListener(() {
      typedText.value = textController.text;
    });
  }

  // Add this method to clear the text
  void clearText() {
    textController.clear();
    typedText.value = "";
  }

  @override
  void onReady() {
    // This is called after the widget is rendered the first time
    // Clear the text when the controller is ready (screen is opened)
    clearText();
    super.onReady();
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