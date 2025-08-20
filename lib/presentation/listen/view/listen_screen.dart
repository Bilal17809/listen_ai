import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/routes/app_routes.dart';
import '../../../core/theme/theme.dart';
import '../controller/listen_controller.dart';
import 'widgets/listen_player_bar.dart';

class ListenScreen extends StatelessWidget {
  final String text;
  const ListenScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ListenController controller = Get.find<ListenController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.prepareText(text);
       controller.play();
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
          title: Text(
            "🎧 Listen Now",
            style: titleLargeStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primaryColor),
            onPressed: () async {
              await controller.stop();
              Get.back();
              Get.offNamed(AppRoutes.home);
            },
          ),
          elevation: 2,
          centerTitle: true,
          iconTheme: const IconThemeData(color: primaryColor),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: roundedDecoration,
              child: Text(
                text,
                style: bodyMediumStyle.copyWith(
                  color: blackTextColor,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ListenPlayerBar(),
      ),
    );
  }
}
