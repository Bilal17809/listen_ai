import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/services/category_services.dart';
import '../../../core/theme/app_colors.dart';

class Mylibrary extends StatefulWidget {

   Mylibrary({super.key});

  @override
  State<Mylibrary> createState() => _MylibraryState();
}

class _MylibraryState extends State<Mylibrary> {
  bool _isSearching = false;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        titleSpacing: 0,
        leadingWidth: 85, // ⬅️ give enough space for text
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft, // ⬅️ vertically centers
            child: "My Library"
                .text
                .size(15) // font size instead of padding

                .make(),
          ),
        ),
        title: _isSearching
            ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8, // ⬅️ reduce vertical padding
                  horizontal: 12,
                ),
              ),
            ).box
                .border(color: Colors.grey, width: 1).size(1000, 20)
                .roundedSM
                .make()
            : Image.asset(
          "images/2x/crown.png",
          height: 30,
        ).centered().onTap(() {
          // handle logo tap
        }),
        actions: [
          _isSearching
              ? TextButton.icon(
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchController.clear();
              });
            },

            label: "Cancel".text.color(Colors.black).make(),
          )
              : IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
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
