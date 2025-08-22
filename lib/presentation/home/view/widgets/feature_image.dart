import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_styles.dart';

class FeatureImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const FeatureImage({required this.imagePath, this.size = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:roundedIconDecoration ,
      child: Image.asset(imagePath),
    );
  }
}
