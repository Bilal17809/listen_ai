import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/theme/theme.dart';
import '../../controller/home_contl.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return SizedBox(
      height: mobileHeight(context) * 0.40,
      width: mobileWidth(context),
      child: Stack(
        children: [
          PageView.builder(
            itemCount: homeController.sliderFeatures.length,
            onPageChanged: (index) {
              homeController.updateIndex(index);
            },
            itemBuilder: (context, index) {
              final sliderFeature = homeController.sliderFeatures[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        sliderFeature.imagePath,
                        fit: BoxFit.contain,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kWhite
                            : null,
                        colorBlendMode: Theme.of(context).brightness == Brightness.dark
                            ? BlendMode.modulate
                            : null,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      sliderFeature.title,
                      textAlign: TextAlign.center,
                      style: titleSmallStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color ?? blackTextColor,
                        fontSize: mobileWidth(context) * 0.03,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  homeController.sliderFeatures.length,
                      (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: 8,
                    height: 8,
                    decoration: sliderDotDecoration(
                        context,
                        homeController.currentIndex.value == index
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}