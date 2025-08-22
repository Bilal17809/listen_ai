import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/routes/app_routes.dart';
import 'package:listen_ai/core/theme/app_colors.dart';
import 'package:listen_ai/presentation/home/view/home_page.dart';
import 'package:listen_ai/presentation/my_library/view/my_library_screen.dart';

import '../controller/bottom_nav.dart';

class MainBottomBar extends StatelessWidget {
  MainBottomBar({super.key});

  final BottomBarController controller = Get.find<BottomBarController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: kWhite,
        selectedItemColor: Colors.black,
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.onItemTapped(index);

          if (index == 0) {
            Get.toNamed(AppRoutes.myLibrary);
          } else if (index == 1) {
            Get.toNamed(AppRoutes.home);
          }
          else if (index == 2) {
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
