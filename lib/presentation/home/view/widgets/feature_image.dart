import 'package:flutter/material.dart';
import '../../../../core/theme/app_styles.dart';

class FeatureImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const FeatureImage({required this.imagePath, this.size = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: featureImageDecoration(context),
      child: Image.asset(
        imagePath,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : null,
        colorBlendMode: Theme.of(context).brightness == Brightness.dark
            ? BlendMode.modulate
            : null,
      ),
    );
  }
}