import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/theme.dart';
import '../../controller/home_contl.dart';


class DocumentBottomSheet extends StatelessWidget {
  const DocumentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      padding: EdgeInsets.all(mobileWidth(context) * 0.04),
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: mobileWidth(context) * 0.1,
            height: mobileHeight(context) * 0.006,
            margin: EdgeInsets.only(bottom: mobileHeight(context) * 0.015),
            decoration: BoxDecoration(
              color: greyColor.withAlpha(100),
              borderRadius: BorderRadius.circular(10),
            ),
          ),


          // title
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
            return Text(
              "Selected: ${controller.selectedFilePath.value.split('/').last}",
              style: bodyMediumStyle,
              overflow: TextOverflow.ellipsis,
            );
          }),
        ],
      ),
    );
  }
}
