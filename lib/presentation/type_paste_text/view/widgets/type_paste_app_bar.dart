import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class TypePasteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TypePasteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black87),
        onPressed: () async {
          Get.offNamed(AppRoutes.home);
        },
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 2,
      centerTitle: true,
      title: Text(
        "✍ Type & Paste Text",
        style: titleLargeStyle.copyWith(
          color: Theme.of(context).brightness == Brightness.dark ? kWhite : kBlack,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
          fontSize: mobileHeight(context) * 0.03,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}