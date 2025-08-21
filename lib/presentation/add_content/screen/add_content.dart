import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/services/category_services.dart';
import '/core/theme/app_styles.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height:300,
              child: ImageSliderWithFlutter(),
            ),
            Container(
              margin: const EdgeInsets.only(top:300),
              width: screenW,
              height: screenH - 180,
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
                          leading:images[index],
                          title:titles[index],
                          subTitle:subtitles[index],);
                        // return Container(
                        //   margin: const EdgeInsets.symmetric(
                        //       horizontal: 5, vertical: 5),
                        //   decoration: listviewDecoration,
                        //   child: ListTile(
                        //     leading: images[index],
                        //     title: Text(
                        //       titles[index],
                        //       style: const TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     subtitle: Text(
                        //       subtitles[index],
                        //       style: const TextStyle(
                        //           fontSize: 14, color: Colors.grey),
                        //     ),
                        //   ),
                        // );
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

class CardItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subTitle;
  const CardItem({super.key,required this.leading,required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration:listviewDecoration,
      child:ListTile(
      leading: leading,
      title:Text(title),
      subtitle: Text(subTitle),
      ),
    );
  }
}


// Example data
final List<String> titles = [
  "First Item",
  "Second Item",
  "Third Item",
  "First Item",
  "Second Item",
  "Third Item",
];

final List<String> subtitles = [
  "This is the first subtitle",
  "This is the second subtitle",
  "This is the third subtitle",
  "This is the first subtitle",
  "This is the second subtitle",
  "This is the third subtitle",
];

final List<Widget> images = [
  Icon(Icons.home, color: Colors.blue),
  Icon(Icons.star, color: Colors.orange),
  Icon(Icons.settings, color: Colors.green),
  Icon(Icons.home, color: Colors.blue),
  Icon(Icons.star, color: Colors.orange),
  Icon(Icons.settings, color: Colors.green),
];
