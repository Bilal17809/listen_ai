import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controller/content_contl.dart';

class ScanTextScreen extends StatelessWidget {
  const ScanTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContentController());

    Future.microtask(() => controller.pickImageFromCamera());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Text"),
        backgroundColor: kWhite,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.pickedImage.value != null)
                Image.file(
                  File(controller.pickedImage.value!.path),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: controller.pickImageFromCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Capture Again"),
              ),
              const SizedBox(height: 20),

              const Text(
                "Extracted Text:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    controller.scannedText.value.isEmpty
                        ? "No text scanned yet."
                        : controller.scannedText.value,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
