import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../controller/type_paste_controller.dart';

class TextFieldContainer extends StatelessWidget {
  final TypePasteController controller;

  const TextFieldContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(mobileWidth(context) * 0.04),
        decoration: roundedDecoration,
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
              fontSize: mobileHeight(context) * 0.018,
            ),
          ),
          style: bodyMediumStyle.copyWith(
            color: blackTextColor,
            height: 1.5,
            fontSize: mobileHeight(context) * 0.018,
          ),
        ),
      ),
    );
  }
}