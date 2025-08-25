import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/presentation/my_library/view/library.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/constant.dart';
import '../../../core/theme/theme.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "My Library",
          style: titleLargeStyle.copyWith(
            fontSize: mobileWidth(context) * 0.05,
            color: Theme.of(context).brightness == Brightness.dark ? kWhite : kBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: mobileWidth(context) * 0.05,
            color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black87,
          ),
          onPressed: Get.back,
        ),
      ),
      body: Obx(() {
        if (controller.libraryItems.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: mobileWidth(context) * 0.08),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    "assets/Empty_List.json",
                    width: mobileWidth(context) * 0.6,
                    height: mobileHeight(context) * 0.3,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Your library is empty.",
                    textAlign: TextAlign.center,
                    style: bodyMediumStyle.copyWith(
                      fontSize: mobileWidth(context) * 0.04,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(mobileWidth(context) * 0.04),
          itemCount: controller.libraryItems.length,
          itemBuilder: (context, index) {
            final LibraryItem item = controller.libraryItems[index];
            return Padding(
              padding: EdgeInsets.only(bottom: mobileHeight(context) * 0.015),
              child: LibraryItemTile(
                controller: controller,
                item: item,
                onTap: () => Get.to(() => ListenScreen(text: item.fullText)),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              blurRadius: mobileWidth(context) * 0.02,
              offset: Offset(0, -mobileHeight(context) * 0.003),
            )
          ],
        ),
        child: MainBottomBar(),
      ),
    );
  }
}
