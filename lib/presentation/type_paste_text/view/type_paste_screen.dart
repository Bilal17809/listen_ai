import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/type_paste_text/view/type_paste.dart';
import '../controller/type_paste_controller.dart';
import '../../listen/view/listen_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constant/constant.dart';

class TypePasteScreen extends StatelessWidget {
  const TypePasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TypePasteController controller = Get.find<TypePasteController>();

    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: const TypePasteAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobileWidth(context) * 0.04,
          vertical: mobileHeight(context) * 0.025,
        ),
        child: Column(
          children: [
            TextFieldContainer(controller: controller),
            SizedBox(height: mobileHeight(context) * 0.03),
            ListenButton(
              controller: controller,
              onPressed: () {
                final String textToSend = controller.typedText.value;
                controller.clearText();
                Get.to(() => ListenScreen(text: textToSend));
              },
            ),
            SizedBox(height: mobileHeight(context) * 0.015),
          ],
        ),
      ),
    );
  }
}