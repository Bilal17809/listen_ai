import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/routes/app_routes.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../controller/listen_controller.dart';
import 'widgets/bottom_audio_controls.dart';

class ListenScreen extends StatelessWidget {
  final String text;
  const ListenScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ListenController controller = Get.find();

    Future.microtask(() async {
      await controller.prepareText(text);
      Future.delayed(const Duration(microseconds: 800), () {
        controller.play();
      });
    });

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, value) {
        if (!didPop) {
          controller.stop();
          Get.offNamed(AppRoutes.home);
        }
      },
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: kWhite,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "Listen",
            style: titleLargeStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
            onPressed: () async {
              await controller.stop();
              Get.offNamed(AppRoutes.home);
            },
          ),
        ),

        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Obx(() =>
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.currentText.value,
                    textAlign: TextAlign.left,
                    style: bodyMediumStyle.copyWith(
                      color: blackTextColor,
                      height: 1.5,
                    ),
                  ),
                )),
              ),
            ),
            BottomAudioControls(controller: controller),
          ],
        ),


      ),
    );
  }
}