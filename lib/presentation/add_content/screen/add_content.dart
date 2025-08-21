import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_colors.dart';
import '/core/services/category_services.dart';
import '/core/theme/app_styles.dart';

class AddContent extends StatelessWidget {
  const AddContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: kWhite,
      body: Column(
        children: [
          ClipRect(
            child: ImageSliderWithFlutter(), // keep your widget
          ),

          // Positioned bottom content
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: screenW,
              height: screenH * 0.7, // fixed height
              decoration: positionDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "What do you want to listen today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // ✅ ListView inside Flexible space
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: titles.length,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         margin: const EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 5),
                  //         decoration: listviewDecoration,
                  //         child: ListTile(
                  //           leading: images[index],
                  //           title: Text(
                  //             titles[index],
                  //             style: const TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           subtitle: Text(
                  //             subtitles[index],
                  //             style: const TextStyle(
                  //                 fontSize: 14, color: Colors.grey),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
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
