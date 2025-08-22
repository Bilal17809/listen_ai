import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/home/view/home.dart';
import '../../../core/common_widget/exit_confir_dlg.dart';
import '../../../core/constant/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/theme.dart';
import '../../bottom_nav/view/bottom_nav.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/widgets/camera_processing_dialog.dart';
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
        backgroundColor: kWhiteF7,
        body: Column(
          children: [
            const Spacer(),
            FeatureListSection(
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
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: kWhite, boxShadow: [boxShadow]),
          child: MainBottomBar(),
        ),
      ),
    );
  }
}
