import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/routes/app_routes.dart';
import '../controller/bottom_nav.dart';

class MainBottomBar extends StatelessWidget {
  MainBottomBar({super.key});

  final BottomBarController controller = Get.find<BottomBarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).textTheme.bodyMedium?.color,
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.onItemTapped(index);

          if (index == 0) {
            Get.toNamed(AppRoutes.myLibrary);
          } else if (index == 1) {
            Get.toNamed(AppRoutes.home);
          } else if (index == 2) {
            Get.toNamed(AppRoutes.settings);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "My Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_sharp),
            label: "Add Content",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      );
    });
  }
}