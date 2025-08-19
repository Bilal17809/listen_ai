import 'dart:ui';

import 'package:get/get.dart';
import 'package:learn_japan/presentation/Greeting/screen/greeting.dart';
import 'package:learn_japan/presentation/Translator/screen/translator.dart';

import '../../presentation/Starte_learning/learn_japance.dart';
import '../../presentation/Starte_learning/screen/start_learning.dart';
import '../../presentation/category/screen/category.dart';

import '../../presentation/learn_japance/screen/learn_japanse.dart';
import '../router/widget/routing.dart';

final List<MenuItem> menuItems = [
  MenuItem(
    image: Image.asset("images/3x/reading-book.png"),
    label: "Learn Japanese",
    targetScreen: StartLearning(),
  ),
  MenuItem(
    image: Image.asset("images/3x/dictionary.png"),
    label: "Japanese Dictionary",
    targetScreen: LearnJapanse(),
  ),
  MenuItem(
    image: Image.asset("images/3x/translation.png"),
    label: "Translator",
    targetScreen: Translator(),
  ),
  MenuItem(image: Image.asset("images/3x/linguistics.png"),
      label: "Grammar",
    targetScreen: Greeting()
  ),
  MenuItem(image: Image.asset("images/3x/left.png"), label: "Phrases",
    targetScreen:Category_screen(),),
  MenuItem(image: Image.asset("images/3x/dictionary.png"), label: "",
    targetScreen: StartLearning(),),
];

class MenuItem {
  final String label;
  final Widget image;
  final Widget targetScreen;

  MenuItem({
    required this.label,
    required this.image,
    required this.targetScreen,
  });
}

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kBodyHp),
      child: GridView.builder(
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return MenuItemCard(item: item);
        },
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => item.targetScreen);
      },
      child: Container(
        decoration: roundedDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: roundedbgicondecotion,
              child: SizedBox(height: 28, width: 28, child: item.image),
            ),
            const SizedBox(height: 8),
            item.label.text.align(TextAlign.center).semiBold.size(14).make(),
          ],
        ),
      ),
    );
  }
}

class MyProgressBar extends StatelessWidget {
  final double progress; // value between 0.0 and 1.0
  final Color backgroundColor;
  final Color progressColor;

  const MyProgressBar({
    super.key,
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
        child: LinearProgressIndicator(
          value: progress, // e.g., 0.7 for 70%
          minHeight: 12,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        ),
      ),
    );
  }
}

Widget buildMenuItem(String imagePath, String label) {
  return VStack([
    VxBox(
      child: Image.asset(imagePath, width: 30),
    ).rounded.p16.color(Color(0xFFF5F7FA)).make(),
    8.heightBox,
    label.text.semiBold.size(14).make(),
  ]).onTap(() {
    // Handle tap action
  });
}

Widget lossonwordSentenco(int num, String label) {
  return VStack([
    num.text.semiBold.size(25).make().px2(),
    3.heightBox,
    label.text.semiBold.size(14).make(),
  ]).onTap(() {
    // Handle tap action
  });
}

final List<LearnjapItem> learnjapItems = [
  LearnjapItem(
    image: Image.asset("images/3x/hand-shake.png"),
    label: "Greetings",
  ),
  LearnjapItem(image: Image.asset("images/3x/chat.png"), label: "Conversation"),
  LearnjapItem(
    image: Image.asset("images/3x/calculator.png"),
    label: "Numbers",
  ),
  LearnjapItem(
    image: Image.asset("images/3x/calendar.png"),
    label: "Time & Date",
  ),
  LearnjapItem(
    image: Image.asset("images/3x/road-map.png"),
    label: "Direction",
  ),
  LearnjapItem(
    image: Image.asset("images/3x/delivery-truck.png"),
    label: "Transportation",
  ),

];

class LearnjapItem {
  final Image image;
  final String label;
  LearnjapItem({required this.image, required this.label});
}

class Learnjapance extends StatelessWidget {
  const Learnjapance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kBodyHp),
      child: GridView.builder(
        itemCount: learnjapItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = learnjapItems[index];
          return LearnjapanceCard(item: item);
        },
      ),
    );
  }
}

class LearnjapanceCard extends StatelessWidget {
  final LearnjapItem item;

  const LearnjapanceCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.greeting);

      },
      child: Container(
        decoration: roundedDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: roundedbgicondecotion,
              child: SizedBox(height: 35, width: 35, child: item.image),
            ),
            const SizedBox(height: 8),
            item.label.text.align(TextAlign.center).semiBold.size(14).make(),
          ],
        ),
      ),
    );
  }
}
class Translatorcard extends StatefulWidget {
  final String mainText; // title text
  final IconData leftIcon;
  final IconData centerIcon;
  final IconData rightIcon;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onCenterPressed;
  final VoidCallback? onRightPressed;

  const Translatorcard({
    super.key,
    required this.mainText,
    required this.leftIcon,
    required this.centerIcon,
    required this.rightIcon,
    this.onLeftPressed,
    this.onCenterPressed,
    this.onRightPressed,
  });

  @override
  State<Translatorcard> createState() => _TranslatorcardState();
}

class _TranslatorcardState extends State<Translatorcard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenw = MediaQuery.of(context).size.width;
    final screenh = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: Title + remove button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.mainText.text.size(16).bold.make().px(10), // Title
            IconButton(
              onPressed: () {
                _controller.clear(); // clears text field
              },
              icon: const Icon(Icons.highlight_remove),
            ),
          ],
        ),

        // TextField under the title
        TextField(
          controller: _controller,  // ✅ correct (named)
          cursorColor: diconbdcolor,
          style: const TextStyle(fontSize: 15),
          decoration: translatordecotion.copyWith(
            isDense: true,
            contentPadding:  EdgeInsets.symmetric(horizontal: 10),
          ),
        ),


        const Spacer(),

        // Bottom icons row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: widget.onLeftPressed,
              icon: Icon(widget.leftIcon, color: blackTextColor, size: 28),
            ),
            IconButton(
              onPressed: widget.onCenterPressed,
              icon: Icon(widget.centerIcon, color: blackTextColor, size: 28),
            ),
            IconButton(
              onPressed: widget.onRightPressed,
              icon: Icon(widget.rightIcon, color: blackTextColor, size: 28),
            ),
          ],
        ).box.size(screenw * 1, screenh * 0.06).color(diconbdcolor).make(),
      ],
    )
        .box
        .color(boxbgcolor)
        .size(screenw * 0.8, screenh * 0.25)
        .make()
        .card
        .make()
        .centered();
  }
}


final List<CategoryItem> category = [
  CategoryItem(
    image: Image.asset("images/3x/noun.png"),
    label: "Noun Phrase",
  ),
  CategoryItem(image: Image.asset("images/3x/verb.png"), label: "Verb Phrase"),
  CategoryItem(
    image: Image.asset("images/3x/adjective.png"),
    label: "Adjective Phrase",
  ),
  CategoryItem(
    image: Image.asset("images/3x/adverb.png"),
    label: "Adverb Phrase",
  ),
  CategoryItem(
    image: Image.asset("images/3x/prepositional.png"),
    label: "Prepositional Phrase",
  ),
  CategoryItem(
    image: Image.asset("images/3x/infinity.png"),
    label: "Infinitive Phrase",
  ),
  CategoryItem(
    image: Image.asset("images/3x/pencil.png"),
    label: "Gerund Phrase",
  ),
  CategoryItem(
    image: Image.asset("images/3x/absolute.png"),
    label: "Absolute Phrase",
  ),
];
class CategoryItem {
  final Image image;
  final String label;
  CategoryItem({required this.image, required this.label});
}
class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kBodyHp),
      child: GridView.builder(
        itemCount: category.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = category[index];
          return CategoryCard(item: item);
        },
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final CategoryItem item;

  const CategoryCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.categoryType,
          arguments: item, // ✅ pass the actual object
        );

      },

      child: Container(
        decoration: roundedDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: roundedbgicondecotion,
              child: SizedBox(height: 35, width: 35, child: item.image),
            ),
            const SizedBox(height: 8),
            item.label.text.align(TextAlign.center).semiBold.size(14).make(),
          ],
        ),
      ),
    );
  }
}


// phrase_data.dart
class PhraseData {
  static final Map<String, Map<String, dynamic>> phraseData = {
    "Noun Phrase": {
      "definition": "A phrase where a noun is the main word.",
      "examples": [
        "The big house",
        "A beautiful garden",
        "My best friend",
        "The tall man"
      ],
    },
    "Verb Phrase": {
      "definition": "A phrase where a verb is the main word.",
      "examples": [
        "is playing cricket",
        "will be singing",
        "has been working hard",
        "should have gone"
      ],
    },
    "Adjective Phrase": {
      "definition": "A phrase that describes a noun.",
      "examples": [
        "full of energy",
        "happy to see you",
        "difficult to understand",
        "interested in music"
      ],
    },
    "Adverb Phrase": {
      "definition": "A phrase that describes a verb, adjective, or another adverb.",
      "examples": [
        "with great speed",
        "in the morning",
        "after the party",
        "very carefully"
      ],
    },
    "Prepositional Phrase": {
      "definition":
      "A phrase that starts with a preposition and ends with a noun/pronoun.",
      "examples": ["on the table", "under the bridge", "at the park", "with my family"],
    },
    "Infinitive Phrase": {
      "definition": "A phrase beginning with 'to + verb'.",
      "examples": [
        "to read a book",
        "to win the match",
        "to help others",
        "to learn Japanese"
      ],
    },
    "Gerund Phrase": {
      "definition": "A phrase where a verb ends with -ing and acts as a noun.",
      "examples": [
        "Running every morning",
        "Eating healthy food",
        "Swimming in the sea",
        "Reading novels daily"
      ],
    },
    "Absolute Phrase": {
      "definition": "A phrase that modifies the whole sentence (adds extra info).",
      "examples": [
        "The sun having set, we went home.",
        "His hands shaking, he opened the letter.",
        "Her voice trembling, she gave the speech.",
        "The work completed, they took a rest."
      ],
    },
  };
}
