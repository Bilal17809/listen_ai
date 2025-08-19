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
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey, // border color
            width: 1, // border thickness
          ),
        ),
        titleSpacing: 0,
        leadingWidth: 85, // ⬅️ give enough space for text
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft, // ⬅️ vertically centers
            child:
                "My Library".text
                    .size(15) // font size instead of padding
                    .make(),
          ),
        ),
        title:Image.asset(
          "images/2x/crown.png",
          height: 25,
        ).box.alignTopRight.make().pOnly(right: 18).onTap(() {
          // handle logo tap
        }),

      ),

      body: Column(
        children: [
          // Horizontal scrollable clickable boxes
          HorizontalBoxRow(
            onTap: (index) {
              print("Clicked item $index");
            },
          ).py(6),

          // Rest of your content
          Expanded(child:ListView.builder(
            itemCount: 1,
              itemBuilder: (context,index){
                return ListTile(
                  leading: IconButton(onPressed: (){}, icon: Icon(Icons.format_align_left)).box.rounded.color(suffixIconColor).make(),
                  title: "Welcome to Listen AI".text.semiBold.make(),
                  subtitle: "Today ' Text ' 1m left".text.make(),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded))
                ).box.rounded.shadowSm.color(kWhite).make().p(10);
              }
          )
          ),
        ],
      ),
    );
  }
}
