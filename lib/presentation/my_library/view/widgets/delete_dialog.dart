import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/theme.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;

  const DeleteDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(mobileWidth(context) * 0.05),
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(mobileWidth(context) * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: mobileWidth(context) * 0.15,
            ),
            SizedBox(height: mobileHeight(context) * 0.015),
            Text(
              title,
              style: titleMediumStyle.copyWith(
                fontSize: mobileWidth(context) * 0.05,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            SizedBox(height: mobileHeight(context) * 0.012),
            Text(
              message,
              textAlign: TextAlign.center,
              style: bodyMediumStyle.copyWith(
                fontSize: mobileWidth(context) * 0.038,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            SizedBox(height: mobileHeight(context) * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? kGreyDark
                            : kGreyLight,
                    foregroundColor:
                        Theme.of(context).textTheme.bodyMedium?.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        mobileWidth(context) * 0.03,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: mobileWidth(context) * 0.06,
                      vertical: mobileHeight(context) * 0.015,
                    ),
                  ),
                  onPressed: () => Get.back(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: mobileWidth(context) * 0.038),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kRed,
                    foregroundColor: kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        mobileWidth(context) * 0.03,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: mobileWidth(context) * 0.06,
                      vertical: mobileHeight(context) * 0.015,
                    ),
                  ),
                  onPressed: () {
                    onConfirm();
                    Get.back();
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(fontSize: mobileWidth(context) * 0.038),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
