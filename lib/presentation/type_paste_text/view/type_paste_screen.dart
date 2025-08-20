import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/constant.dart';
import '../../listen/view/listen_screen.dart';
import '../controller/type_paste_controller.dart';
import '../../../core/theme/theme.dart';

class TypePasteScreen extends StatelessWidget {
  const TypePasteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TypePasteController controller = Get.find<TypePasteController>();
    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 2,
        centerTitle: true,
        title: Text(
          "✍ Type & Paste Text",
          style: titleLargeStyle.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: mobileHeight(context) * 0.03,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobileWidth(context)* 0.04,
          vertical: mobileHeight(context)  * 0.025,
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(mobileWidth(context) * 0.04),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withAlpha(50),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller.textController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: "Type or paste text here...",
                    border: InputBorder.none,
                    hintStyle: bodyMediumStyle.copyWith(
                      color: greyColor,
                      fontSize: mobileHeight(context)  * 0.018,
                    ),
                  ),
                  style: bodyMediumStyle.copyWith(
                    color: blackTextColor,
                    height: 1.5,
                    fontSize: mobileHeight(context)  * 0.018,
                  ),
                ),
              ),
            ),
            SizedBox(height: mobileHeight(context)  * 0.03),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                height: mobileHeight(context)  * 0.07,
                child: ElevatedButton(
                  onPressed:
                      controller.typedText.value.isEmpty
                          ? null
                          : () {
                            Get.to(
                              () => ListenScreen(
                                text: controller.typedText.value,
                              ),
                            );
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 6,
                  ),
                  child: Text(
                    "Listen",
                    style: bodyLargeStyle.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: mobileHeight(context)  * 0.022,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: mobileHeight(context)  * 0.015),
          ],
        ),
      ),
    );
  }
}
