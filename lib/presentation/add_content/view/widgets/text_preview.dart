import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme.dart';
import '../../controller/content_contl.dart';


class TextPreviewScreen extends StatelessWidget {
  const TextPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContentController>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Extracted Text"), backgroundColor: kWhite),
      body: Column(
        children: [
          // Image preview 100%
          Obx(() {
            if (controller.pickedImage.value != null) {
              return Image.file(
                File(controller.pickedImage.value!.path),
                width: double.infinity,
                height: screenHeight * 0.5,
                fit: BoxFit.cover,
              );
            }
            return SizedBox.shrink();
          }),

          SizedBox(height: 10),

          // Text display
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                padding: EdgeInsets.all(12),
                child: Text(
                  controller.scannedText.value.isEmpty
                      ? "No text detected."
                      : controller.scannedText.value,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }),
          ),

          // Play Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.play_arrow, color: kMintGreen, size: 32),
                onPressed: controller.speakText,
              ),
              IconButton(
                icon: Icon(Icons.stop, color: kRed, size: 32),
                onPressed: controller.stopSpeaking,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
