import 'package:flutter/material.dart';
import 'package:listen_ai/core/theme/app_colors.dart';
import 'package:listen_ai/presentation/home/view/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
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

    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}



final List<String> titles = [
  "Document",
  "Scan Text",
  "Type or Paste Text",
  "Mail",
];

final List<String> subtitles = [
  "Upload files form device",
  "Scanned document or images",
  "Input or paste text to listen",
  "Listen to e-mails easily",
];


final List<Widget> images = [
  Image.asset("images/google_docs.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/scanner.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/font.png")
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
  Image.asset("images/email.png", )
      .box.size(40, 40).rounded.color(iconbdcolor).make(),
];
