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
      decoration: roundedDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "What do you want to listen today",
              style: titleSmallStyle.copyWith(color: blackTextColor),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (context, index) {
                final feature = features[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: GestureDetector(
                    onTap: () => onFeatureTap(index),
                    child: Container(
                      decoration: roundedDecoration,
                      child: ListTile(
                        leading: FeatureImage(imagePath: feature.imagePath),
                        title: Text(
                          feature.title,
                          style: titleMediumStyle.copyWith(
                            color: blackTextColor,
                          ),
                        ),
                        subtitle: Text(
                          feature.subtitle,
                          style: bodyMediumStyle.copyWith(color: textGreyColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
