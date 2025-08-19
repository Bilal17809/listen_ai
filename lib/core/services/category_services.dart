
import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_colors.dart';

import 'package:velocity_x/velocity_x.dart';
import '../../presentation/add_content/screen/add_content.dart';
import '../../presentation/mylibeary/screen/mylibrary.dart';
import '../../presentation/setting/screen/setting.dart';
class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    Mylibrary(),
    AddContent(),
    Setting(), // replace with your settings screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // swaps screen here
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}




final List<String> titles = [
  "Document",
  "Scan Text",
  "Web Link",
  "Type or Paste Text",
  "Mail",
];

final List<String> subtitles = [
  "Upload files form Drive or device",
  "Scanned document or images",
  "Convert URLs to audio",
  "Input or paste text to listen",
  "Listen to e-mails easily",
];

// 👇 List of images
final List<Widget> images = [
  Image.asset("images/2x/google_docs.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/2x/scanner.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/2x/link.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/2x/font.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/2x/email.png", )
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
];


// Category model
class CategoryItem {
  final String title;
  final IconData? icon;

  CategoryItem({required this.title, this.icon});
}

// Horizontal scrollable row
class HorizontalBoxRow extends StatelessWidget {
  final Function(int)? onTap;

  HorizontalBoxRow({Key? key, this.onTap}) : super(key: key);

  final List<CategoryItem> items = [
    CategoryItem(title: "All"),
    CategoryItem(title: "Continue"),
    CategoryItem(title: "Favorites", icon: Icons.favorite,),
    CategoryItem(title: "Downloaded", icon: Icons.download),
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
            onTap: () {
              if (onTap != null) onTap!(index);
              print("Clicked: ${item.title}");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  if (item.icon != null) ...[
                    Icon(item.icon, size: 16, color: greyColor),
                    const SizedBox(width: 6),
                  ],
          item.title.text.color(greyColor).size(14).make()

                ],
              )
            ),
          );
        },
      )
    );
  }
}

