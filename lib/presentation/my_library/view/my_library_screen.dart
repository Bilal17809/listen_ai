import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../data/models/library_item.dart';
import '../../bottom_nav/view/bottom_nav.dart';
import '../../listen/view/listen_screen.dart';
import '../controller/my_library_contrl.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyLibraryController controller = Get.find();
    controller.loadLibraryIfNeeded();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "My Library",
          style: titleLargeStyle.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.libraryItems.isEmpty) {
          return const Center(
            child: Text(
              "Your library is empty.\nSave some text to get started!",
              textAlign: TextAlign.center,
              style: bodyMediumStyle,
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: controller.libraryItems.length,
            itemBuilder: (context, index) {
              final LibraryItem item = controller.libraryItems[index];
              return _buildLibraryItemTile(controller, item, context);
            },
          );
        }
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kWhite, boxShadow: [boxShadow]),
        child: MainBottomBar(),
      ),
    );
  }

  Widget _buildLibraryItemTile(
      MyLibraryController controller, LibraryItem item, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(
          item.title,
          style: titleSmallStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "Saved: ${item.savedAt.toLocal().toString().split('.').first}",
          style: bodySmallStyle.copyWith(
            color: textGreyColor,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: kRed),
          onPressed: () {
            Get.defaultDialog(
              title: "Delete Item",
              middleText: "Are you sure you want to delete '${item.title}'?",
              textConfirm: "Delete",
              textCancel: "Cancel",
              confirmTextColor: kWhite,
              buttonColor: kRed,
              onConfirm: () {
                controller.removeItem(item.id);
                Get.back();
              },
              onCancel: () {
                Get.back();
              },
            );
          },
        ),
        onTap: () {
          Get.to(() => ListenScreen(text: item.fullText));
        },
      ),
    );
  }
}