import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';


class CameraProcessingDialog extends StatelessWidget {
  const CameraProcessingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}