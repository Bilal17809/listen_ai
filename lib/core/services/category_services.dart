import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/extension/extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../theme/app_styles.dart';
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
      "img": "images/Group 1.png",
      "title": "Scan and listen any book or\ndocument effortlessly",
    },
    {
      "img": "images/Group 2.png",
      "title": "Boost productivity with adjustable\nplayback speed",
    },
  ];

  int activeIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {


    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: sliderData.length,
      options: CarouselOptions(
        height: context.screenHeight * 0.5,
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
                height: context.screenHeight * 0.4,
                width: context.screenWidth,

              ),
            ),

            // Title text
            Positioned(
              left: 10,
              bottom: 15,
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
              right: 10,
              bottom: 25,
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
                  width: context.screenWidth * 0.25,
                  height: context.screenHeight * 0.03,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Try for fre...",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),

            // Page Indicator
            Positioned(
              bottom: 60,
              left: 13,
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


  return Stack(
    children: [
      Padding(
        padding:  EdgeInsets.only(top: 40.0),
        child: Image.asset(
          "images/3x/Group.png",
          height: context.screenHeight * 0.35,
          width: context.screenWidth,

        ),
      ),

      // Close Button
      Positioned(
        top: 12,
        left: 15,
        child: IconButton(
          icon: Icon(Icons.clear, color: Colors.grey[400], size: 25),
          onPressed: () => Get.back(),
        ),
      ),

      // Restore Button
      Positioned(
        top: 25,
        right: 25,
        child: Container(
          alignment: Alignment.center,
          width: context.screenWidth * 0.17,
          height: context.screenHeight * 0.04,
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

final List<String> titles = [
  "Document",
  "Scan Text",
  "Web Link",
  "Type or Paste Text",
 "Mail"
];

final List<String> subtitles = [
  "Upload files form Drive or device",
  "Scanned document or images",
  "Convert URLs to audio",
  "Input or Paste text to listen",
  "Listen to e-mail easily"
];

final List<Widget> images = [
  Image.asset(
    "images/2x/google_docs.png", // replace with your image

  ),
  Image.asset(
    "images/2x/scanner.png", // replace with your image

  ),
  Image.asset(
    "images/2x/link.png", // replace with your image

  ),
  Image.asset(
    "images/2x/font.png", // replace with your image

  ),
  Image.asset(
    "images/2x/email.png", // replace with your image

  ),
];
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
// since you used context.screenWidth

class SupportDialog extends StatelessWidget {
  const SupportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.screenWidth * 0.9,
        height: context.screenHeight * 0.341,
        padding: const EdgeInsets.symmetric(vertical: 19),
        decoration: supportDecoration, // make sure you defined this
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.star_border_outlined),
                ),
                Text(
                  "Like us, Rate us",
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.favorite, color: Colors.grey, size: 20),
              ],
            ),
            const Divider(),
            rowItem(Icons.contact_support_outlined, "FAQ & Support"),
            const Divider(),
            rowItem(Icons.privacy_tip_outlined, "Privacy Policy"),
            const Divider(),
            rowItem(Icons.sticky_note_2_outlined, "Terms of Service"),

          ],
        ),
      ),
    );
  }

  /// reusable row builder
  Widget rowItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700]),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
 // since you are using context extensions

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.screenWidth * 0.9,
        height: context.screenHeight * 0.27,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: preferencesDecoration, // your custom BoxDecoration
        child: Column(
          children: [
            // Voice Cloning Row
            Row(
              children: [
                const Icon(Icons.mic),
                const SizedBox(width: 8),
                Text(
                  "Voice Cloning",
                  style:
                  context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Container(
                  width: context.screenWidth * 0.085,
                  height: context.screenHeight * 0.027,
                  alignment: Alignment.center,
                  decoration: voiceDecoration,
                  child: Text(
                    "New",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: kDarkerGreen1,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
            const Divider(),

            // Change Voice Row
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.surround_sound_rounded),
                ),
                const SizedBox(width: 5),
                Text(
                  "Change voice",
                  style:
                  context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("Sam"),
                ),
              ],
            ),
            const Divider(),

            // App Language Row
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.language_outlined),
                ),
                const SizedBox(width: 5),
                Text(
                  "App Language",
                  style:
                  context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text("English (US)"),
                ),
              ],
            ),
            const Divider(),

            // Request Feature Row
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.note_alt_outlined),
                ),
                const SizedBox(width: 5),
                Text(
                  "Request Feature",
                  style:
                  context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

