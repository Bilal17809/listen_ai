import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/extension/extension.dart';
import '/core/services/category_services.dart';
import '/core/theme/app_styles.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 5),
              child: SizedBox(
                height:context.screenHeight*0.3,
                width: context.screenWidth*0.97,
                child: ImageSliderWithFlutter(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:229),
              width: context.screenWidth,
              height: context.screenHeight,
              decoration: positionDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "What do you want to listen today",
                      style:context.textTheme.labelLarge
                    ),
                  ),
                  const SizedBox(height: 16),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return CardItem(
                          leading:Container(
                            height: context.screenHeight*0.06,
                              width: context.screenWidth*0.12,
                           decoration:cardItemDecoration,
                              child: images[index]),
                          title:titles[index],
                          subTitle:subtitles[index],);

                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// cardItem 




