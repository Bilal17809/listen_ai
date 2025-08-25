import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/theme.dart';
import '../../../../data/models/library_item.dart';
import '../../controller/my_library_contrl.dart';
import 'delete_dialog.dart';

class LibraryItemTile extends StatelessWidget {
  final MyLibraryController controller;
  final LibraryItem item;
  final VoidCallback onTap;

  const LibraryItemTile({
    super.key,
    required this.controller,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: mobileHeight(context) * 0.015),
      elevation: 2,
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(mobileWidth(context) * 0.025),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: mobileWidth(context) * 0.04,
          vertical: mobileHeight(context) * 0.012,
        ),
        title: Text(
          item.title,
          style: titleSmallStyle.copyWith(
            fontSize: mobileWidth(context) * 0.04,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "Saved: ${item.savedAt.toLocal().toString().split('.').first}",
          style: bodySmallStyle.copyWith(
            fontSize: mobileWidth(context) * 0.032,
            color: Theme.of(context).textTheme.bodySmall?.color ?? textGreyColor,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            size: mobileWidth(context) * 0.06,
            color: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            Get.dialog(
              DeleteDialog(
                title: "Delete Item",
                message: "Are you sure you want to delete '${item.title}'?",
                onConfirm: () {
                  controller.removeItem(item.id);
                },
              ),
            );
          },
        ),
        onTap: onTap,
      ),
    );
  }
}
