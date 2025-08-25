import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/routes/app_routes.dart';
import 'package:listen_ai/presentation/listen/view/widgets/bottom_audio_controls.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../my_library/controller/my_library_contrl.dart';
import '../controller/listen_controller.dart';

class ListenScreen extends StatelessWidget {
  final String text;
  const ListenScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ListenController controller = Get.find();
    final MyLibraryController libraryController = Get.find();

    Future.microtask(() async {
      await controller.prepareText(text);
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: appBarElevation,
          centerTitle: true,
          title: Text(
            "Listen",
            style: titleLargeStyle.copyWith(
              color: Theme.of(context).appBarTheme.titleTextStyle?.color ??
                  (Theme.of(context).brightness == Brightness.dark ? kWhite : kBlack),
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).appBarTheme.iconTheme?.color ?? kBlack,
            ),
            onPressed: () async {
              await controller.stop();
              Get.offNamed(AppRoutes.home);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).appBarTheme.iconTheme?.color ?? kBlack,
              ),
              onPressed: () {
                libraryController.addItem(text);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: pagePadding,
                child: Obx(
                      () => Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.currentText.value,
                      textAlign: TextAlign.left,
                      style: bodyMediumStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color ?? blackTextColor,
                        height: textLineHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BottomAudioControls(controller: controller),
          ],
        ),
      ),
    );
  }
}
