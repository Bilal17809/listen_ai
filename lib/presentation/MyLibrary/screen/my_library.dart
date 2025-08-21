import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/services/category_services.dart';
import '/core/theme/app_colors.dart';

class MyLibrary extends StatelessWidget {
   const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        leading:  Padding(
          padding: EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'My Library',
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            // handle logo tap
          },
          child: Padding(
            padding:  EdgeInsets.only(right: 18),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "images/2x/crown.png",
                height: 25,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Horizontal scrollable clickable boxes
          HorizontalBoxRow(
            onTap: (index) {

            },
          ),

          // Rest of your content
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  margin:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey..withAlpha(200),
                        blurRadius: 5,
                        offset:  Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: suffixIconColor,
                      child:  Icon(
                        Icons.format_align_left,
                        color: Colors.black,
                      ),
                    ),
                    title:  Text(
                      "Welcome to Listen AI",
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle:  Text("Today ' Text ' 1m left"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon:  Icon(Icons.more_vert_rounded),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
