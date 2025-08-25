import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/constant.dart';
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
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
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

          Text(
            "Document",
            style: titleMediumStyle.copyWith(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),

          SizedBox(height: mobileHeight(context) * 0.025),
          GestureDetector(
            onTap: controller.pickFile,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: mobileWidth(context) * 0.02,
                vertical: mobileHeight(context) * 0.003,
              ),
              decoration: roundedDecorationWithShadow.copyWith(
                color: Theme.of(context).cardTheme.color,
              ),
              child: ListTile(
                leading: Container(
                  width: mobileWidth(context) * 0.10,
                  height: mobileWidth(context) * 0.10,
                  decoration: roundedIconDecoration.copyWith(
                    color: Theme.of(context).colorScheme.primary.withAlpha(30),
                  ),
                  child: Image.asset(
                    "images/google_docs.png",
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(
                  "Upload from device",
                  style: titleSmallStyle.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                subtitle: Text(
                  "PDF, ePub, DOCX, TXT & more",
                  style: bodyMediumStyle.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
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
              style: bodyMediumStyle.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              overflow: TextOverflow.ellipsis,
            );
          }),

          // Extracting status
          Obx(() {
            if (controller.isExtracting.value) {
              return Padding(
                padding: EdgeInsets.all(mobileWidth(context) * 0.02),
                child: Text(
                  "Extracting...",
                  style: bodySmallStyle.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
