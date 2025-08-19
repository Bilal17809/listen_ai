import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listen_ai/core/theme/app_colors.dart';
import 'package:listen_ai/presentation/add_content/view/widgets/document_bottom_sheet.dart';
import 'package:listen_ai/presentation/add_content/view/widgets/scan_text.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/services/category_services.dart';

class AddContent extends StatelessWidget {


 const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenh=MediaQuery.of(context).size.height;
    final screenw=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                "What do you want to listen today"
                    .text
                    .semiBold
                    .size(18)

                     .make().pOnly(top: 10,left: 10)
                    , // some padding

                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: images[index],
                        onTap: () {
                          if (index == 0) {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (_) =>SizedBox(
                                height: MediaQuery.of(context).size.height * 0.3,
                                child: const DocumentBottomSheet(),
                              ),
                            );
                          }
                          if (index == 1) {
                            Get.to(() => const ScanTextScreen());
                          }

                        },

                        title: Text(
                          titles[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          subtitles[index],
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ).box.rounded.shadowSm.color(kWhite).make().pOnly(top: 5,left: 10,right: 10);
                    },
                  ),
                ),
              ],
            ),
          ).box.rounded.size(screenw*1, screenh*0.65).color(kWhite).make(),
        ],
      ),
          bottomNavigationBar: MainBottomBar()
              .box
              .color(kWhite) // background color
              .shadowSm          // large shadow
               // optional: rounded top corners
              .make()
    );
  }
}
