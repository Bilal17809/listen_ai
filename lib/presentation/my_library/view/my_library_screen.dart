import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/my_library/view/widgets/library_item_tile.dart';
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
    final controller = Get.find<MyLibraryController>();

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
          onPressed: Get.back,
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
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: controller.libraryItems.length,
          itemBuilder: (context, index) {
            final LibraryItem item = controller.libraryItems[index];
            return LibraryItemTile(
              controller: controller,
              item: item,
              onTap: () => Get.to(() => ListenScreen(text: item.fullText)),
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kWhite, boxShadow: [boxShadow]),
        child: MainBottomBar(),
      ),
    );
  }
}
