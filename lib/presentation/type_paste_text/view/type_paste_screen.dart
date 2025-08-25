import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/type_paste_controller.dart';
import '../../listen/view/listen_screen.dart';
import '../../../../core/constant/constant.dart';
import 'widgets/text_field_container.dart';
import 'widgets/listen_button.dart';
import 'widgets/type_paste_app_bar.dart';

class TypePasteScreen extends StatelessWidget {
  const TypePasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TypePasteController controller = Get.find<TypePasteController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            SizedBox(height: mobileHeight(context) * 0.02),
          ],
        ),
      ),
    );
  }
}