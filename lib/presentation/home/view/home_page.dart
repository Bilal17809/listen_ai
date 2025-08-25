import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/home/view/widgets/image_slider.dart';
import '../../../core/common_widget/exit_confir_dlg.dart';
import '../../../core/constant/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../bottom_nav/view/bottom_nav.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/widgets/camera_processing_dialog.dart';
import 'home.dart';

import '../../listen/view/listen_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.find<CameraController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, value) {
        if (!didPop) {
          showExitConfirmationDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            const ImageSlider(),
            Expanded(
              child: SingleChildScrollView(
                child: FeatureListSection(
                  onFeatureTap: (index) async {
                    if (index == 0) {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (_) => SizedBox(
                          height: mobileHeight(context) * 0.3,
                          child: const DocumentBottomSheet(),
                        ),
                      );
                    } else if (index == 1) {
                      Get.dialog(
                        const CameraProcessingDialog(),
                        barrierDismissible: false,
                      );
                      await cameraController.captureImage();
                      if (Get.isDialogOpen ?? false) Get.back();

                      if (cameraController.scannedText.value.isNotEmpty) {
                        Get.to(() => ListenScreen(
                          text: cameraController.scannedText.value,
                        ));
                      }
                    } else if (index == 2) {
                      Get.toNamed(AppRoutes.typePasteText);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomSheetTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withAlpha(51)
                    : Colors.black.withAlpha(51),
                blurRadius: 6,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child:MainBottomBar(),
        ),
      ),
    );
  }
}