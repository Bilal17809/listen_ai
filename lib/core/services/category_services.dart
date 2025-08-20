import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/presentation/MyLibrary/screen/my_library.dart';
import '/presentation/add_content/screen/add_content.dart';

import '/presentation/premium/screen/premium.dart';
import '/presentation/setting/screen/setting.dart';
import '/core/theme/app_colors.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const MyLibrary(),
    const AddContent(),
    const Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kWhite,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "My Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_sharp),
            label: "Add Content",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}

class HorizontalBoxRow extends StatelessWidget {
  final Function(int)? onTap;
  const HorizontalBoxRow({super.key, this.onTap});

  final List<Map<String, dynamic>> items = const [
    {"title": "All", "icon": null},
    {"title": "Continue", "icon": null},
    {"title": "Favorites", "icon": Icons.favorite},
    {"title": "Downloaded", "icon": Icons.download},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  if (item["icon"] != null) ...[
                    Icon(item["icon"], size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    item["title"],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageSliderWithFlutter extends StatefulWidget {
  const ImageSliderWithFlutter({super.key});

  @override
  State<ImageSliderWithFlutter> createState() => _ImageSliderWithFlutterState();
}

class _ImageSliderWithFlutterState extends State<ImageSliderWithFlutter> {
  final List<Map<String, String>> sliderData = [
    {
      "img": "images/Frame.png",
      "title": "Download and listen anytime,\nanywhere",
    },
    {
      "img": "images/Frame.png",
      "title": "Scan and listen any book or\ndocument effortlessly",
    },
    {
      "img": "images/Frame.png",
      "title": "Boost productivity with adjustable\nplayback speed",
    },
  ];

  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: sliderData.length,
      options: CarouselOptions(
        height: screenH * 0.4,
        autoPlay: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() => activeIndex = index);
        },
      ),
      itemBuilder: (context, index, _) {
        final item = sliderData[index];
        return Stack(
          children: [
            // Background image
            ClipRRect(
              child: Image.asset(
                item["img"]!,
                height: screenH * 0.4,
                width: screenW,
                fit: BoxFit.cover,
              ),
            ),

            // Title text
            Positioned(
              left: 20,
              bottom: 60,
              child: Text(
                item["title"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Try Button
            Positioned(
              right: 20,
              bottom: 70,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const Premium(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 300),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: screenW * 0.25,
                  height: screenH * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Try for free",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),

            // Page Indicator
            Positioned(
              bottom: 100,
              left: 23,
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: sliderData.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  activeDotColor: Colors.white,
                  dotColor: Colors.white54,
                ),
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget buildHeaderImage(BuildContext context) {
  final screenH = MediaQuery.of(context).size.height;
  final screenW = MediaQuery.of(context).size.width;

  return Stack(
    children: [
      Image.asset(
        "images/3x/Group.png",
        height: screenH * 0.45,
        width: screenW,
        fit: BoxFit.cover,
      ),

      // Close Button
      Positioned(
        top: 30,
        left: 15,
        child: IconButton(
          icon: Icon(Icons.clear, color: Colors.grey[400], size: 25),
          onPressed: () => Get.back(),
        ),
      ),

      // Restore Button
      Positioned(
        top: 25,
        right: 15,
        child: Container(
          alignment: Alignment.center,
          width: screenW * 0.17,
          height: screenH * 0.04,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text("Restore", style: TextStyle(color: Colors.grey)),
        ),
      ),
    ],
  );
}

Widget rowItem(IconData icon, String title) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(icon),
      ),
      Text(title, style: const TextStyle(fontSize: 18)),
    ],
  );
}
final List<String> titles = [
  "First Item",
  "Second Item",
  "Third Item",
];

final List<String> subtitles = [
  "This is the first subtitle",
  "This is the second subtitle",
  "This is the third subtitle",
];

final List<Widget> images = [
  Icon(Icons.home, color: Colors.blue),
  Icon(Icons.star, color: Colors.orange),
  Icon(Icons.settings, color: Colors.green),
];