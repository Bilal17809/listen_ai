import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/theme/theme.dart';
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
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(
          item.title,
          style: titleSmallStyle.copyWith(fontWeight: FontWeight.w500),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "Saved: ${item.savedAt.toLocal().toString().split('.').first}",
          style: bodySmallStyle.copyWith(color: textGreyColor),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: kRed),
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
