import 'package:flutter/material.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/services/features_list.dart';
import '../../../../core/theme/theme.dart';
import 'feature_image.dart';

class FeatureListSection extends StatelessWidget {
  final void Function(int index) onFeatureTap;

  const FeatureListSection({super.key, required this.onFeatureTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobileWidth(context),
      height: mobileHeight(context) * 0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "What do you want to listen today",
              style: titleSmallStyle.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color ?? blackTextColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(features.length, (index) {
                final feature = features[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: GestureDetector(
                    onTap: () => onFeatureTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: FeatureImage(imagePath: feature.imagePath),
                        title: Text(
                          feature.title,
                          style: titleMediumStyle.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge?.color ?? blackTextColor,
                          ),
                        ),
                        subtitle: Text(
                          feature.subtitle,
                          style: bodyMediumStyle.copyWith(
                            color: Theme.of(context).textTheme.bodyMedium?.color ?? textGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}