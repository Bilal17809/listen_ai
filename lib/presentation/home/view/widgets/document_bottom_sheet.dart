import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../document/controller/document_controller.dart';

class DocumentBottomSheet extends StatelessWidget {
  const DocumentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final DocumentController controller = Get.find<DocumentController>();

    return Container(
      padding: EdgeInsets.all(mobileWidth(context) * 0.04),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: mobileWidth(context) * 0.1,
            height: mobileHeight(context) * 0.006,
            margin: EdgeInsets.only(bottom: mobileHeight(context) * 0.015),
            decoration: greyDragHandleDecoration,
          ),
          Text("Document", style: titleMediumStyle),
          SizedBox(height: mobileHeight(context) * 0.025),
          GestureDetector(
            onTap: controller.pickFile,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: mobileWidth(context) * 0.02,
                vertical: mobileHeight(context) * 0.003,
              ),
              decoration: roundedDecoration,
              child: ListTile(
                leading: Container(
                  width: mobileWidth(context) * 0.1,
                  height: mobileWidth(context) * 0.1,
                  decoration: BoxDecoration(
                    color: iconbdcolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    "images/google_docs.png",
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text("Upload from device", style: titleSmallStyle),
                subtitle: const Text(
                  "PDF, ePub, DOCX, TXT & more",
                  style: bodyMediumStyle,
                ),
              ),
            ),
          ),
          SizedBox(height: mobileHeight(context) * 0.012),
          Obx(() {
            if (controller.selectedFilePath.isEmpty) {
              return const SizedBox.shrink();
            }
            final fileName = controller.selectedFilePath.value.split('/').last;
            return Text(
              "Selected: $fileName",
              style: bodyMediumStyle,
              overflow: TextOverflow.ellipsis,
            );
          }),
          Obx(() {
            if (controller.isExtracting.value) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Extracting...", style: bodySmallStyle),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
