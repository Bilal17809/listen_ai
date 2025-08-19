
import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_colors.dart';

import 'package:velocity_x/velocity_x.dart';
import '../../presentation/add_content/view/add_content.dart';
import '../../presentation/mylibeary/screen/mylibrary.dart';
class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _currentIndex = 1; // default selected index

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mylibrary()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddContent()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddContent()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kWhite,
      selectedItemColor: Colors.black,
      currentIndex: _currentIndex, // now updates properly
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
