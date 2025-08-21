import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/home/view/widgets/document_bottom_sheet.dart';
import '../../../core/constant/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/category_services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../camera/controller/camera_controller.dart';
import '../../camera/view/widgets/camera_processing_dialog.dart';
import '../../listen/view/listen_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.find<CameraController>();
    return Scaffold(
      backgroundColor: kWhiteF7,
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: mobileWidth(context),
            height: mobileHeight(context) * 0.65,
            decoration: roundedDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "What do you want to listen today",
                    style: titleSmallStyle.copyWith(color: blackTextColor),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: GestureDetector(
                        onTap: () async {
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
                            Get.offNamed(AppRoutes.typePasteText);
                          }
                        },
                        child: Container(
                          decoration: roundedDecoration,
                          child: ListTile(
                            leading: images[index],
                            title: Text(
                              titles[index],
                              style: titleMediumStyle.copyWith(color: blackTextColor),
                            ),
                            subtitle: Text(
                              subtitles[index],
                              style: bodyMediumStyle.copyWith(color: textGreyColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kWhite, boxShadow: [boxShadow]),
        child: const MainBottomBar(),
      ),
    );
  }
}