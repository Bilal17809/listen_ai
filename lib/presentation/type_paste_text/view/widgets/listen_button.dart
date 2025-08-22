import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../controller/type_paste_controller.dart';

class ListenButton extends StatelessWidget {
  final TypePasteController controller;
  final VoidCallback onPressed;

  const ListenButton({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: double.infinity,
        height: mobileHeight(context) * 0.07,
        child: ElevatedButton(
          onPressed: controller.typedText.value.isEmpty ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: kYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )
          ),
          child: Text(
            "Listen",
            style: bodyLargeStyle.copyWith(
              color: kWhite,
              fontWeight: FontWeight.bold,
              fontSize: mobileHeight(context) * 0.022,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    });
  }
}
