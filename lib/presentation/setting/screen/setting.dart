import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;
    final screenh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: textWhiteColor,
        title: "Setting".text.semiBold.make(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "preferences".text.make().p(10),
            Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.mic),
                        "Voice Cloning".text.size(18).make(),
                        "new".text
                            .color(kDarkerGreen1)
                            .center
                            .make()
                            .box
                            .color(kMediumGreen2)
                            .size(screenw * 0.085, screenh * 0.027)
                            .rounded
                            .make()
                            .px4(),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right).pOnly(right: 10),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.surround_sound_rounded).pOnly(left: 5),
                        "Change voice".text.size(18).make().pOnly(left: 5),

                        Spacer(),
                        "Sam".text.make().pOnly(right: 10),
                      ],
                    ).py4(),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.language_outlined).pOnly(left: 5),
                        "App Language".text.size(18).make().pOnly(left: 5),

                        Spacer(),
                        "English (US)".text.make().pOnly(right: 10)
                      ],
                    ).py4(),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.note_alt_outlined).pOnly(left: 5),
                        "Request Feature".text.size(18).make().pOnly(left: 5),

                      
                      ],
                    ).py4(),
                  ],
                ).box.rounded.shadowSm
                .size(screenw * 0.9, screenh * 0.27)
                .color(kWhite)
                .py8
                .make()
                .centered(),
            "preferences".text.make().p(10),
            Row(
              children: [
                Image.asset("images/google.png"),
                "Google".text.make(),
                Spacer(),
                "Connect".text.color(kWhite).center.make().box.color(kBlack).rounded.make()
              ],
            ).box.rounded.shadowSm
                .size(screenw * 0.9, screenh * 0.27)
                .color(kWhite)
                .py8
                .make()
                .centered(),
          ],
        ),
      ),
    );
  }
}
