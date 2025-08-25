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

  void clearText() {
    textController.clear();
    typedText.value = "";
  }

  @override
  void onReady() {
    clearText();
    super.onReady();
  }



  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}