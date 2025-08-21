import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/extension/extension.dart';
import '../../../core/services/category_services.dart';
import '../../../core/theme/app_styles.dart';
import '/core/theme/app_colors.dart';

class Setting extends StatelessWidget {
   const Setting({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title:  Text(
          "Setting",
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.all(10),
                child: Text("Preferences"),
              ),

              // Preferences Box
              Center(
                child: Container(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.27,
                  padding:  EdgeInsets.symmetric(vertical: 16),
                  decoration: preferencesDecoration,
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Icon(Icons.mic),
                           SizedBox(width: 8),
                           Text(
                            "Voice Cloning",
                            style: context.textTheme.bodyLarge?.copyWith(fontSize: 18),
                          ),
                           SizedBox(width: 8),
                          Container(
                            width: context.screenWidth * 0.085,
                            height: context.screenHeight * 0.027,
                            alignment: Alignment.center,
                            decoration:voiceDecoration,
                            child: Text(
                              "New",
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: kDarkerGreen1,
                                fontSize: 12,
                              ),
                            ),
                          ),
                           Spacer(),
                           Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                       Divider(),
                      Row(
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.surround_sound_rounded),
                          ),
                          SizedBox(width: 5),
                          Text("Change voice", style: context.textTheme.bodyLarge?.copyWith(fontSize: 18)),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("Sam"),
                          ),
                        ],
                      ),
                       Divider(),
                      Row(
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.language_outlined),
                          ),
                          SizedBox(width: 5),
                          Text("App Language", style: context.textTheme.bodyLarge?.copyWith(fontSize: 18)),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("English (US)"),
                          ),
                        ],
                      ),
                       Divider(),
                      Row(
                        children:  [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.note_alt_outlined),
                          ),
                          SizedBox(width: 5),
                          Text("Request Feature", style: context.textTheme.bodyLarge?.copyWith(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

               Padding(
                padding: EdgeInsets.all(10),
                child: Text("Linked Accounts"),
              ),

              // Linked Accounts
              Center(
                child: Container(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.07,
                  padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: linkedDecoration,
                  child: Row(
                    children: [
                      Image.asset("images/google.png"),
                       SizedBox(width: 10),
                       Text("Google", style: context.textTheme.bodyLarge?.copyWith(fontSize: 19)),
                       Spacer(),
                      Container(
                        width: context.screenWidth * 0.22,
                        height: context.screenHeight * 0.04,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kBlack,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child:  Text(
                          "Connect",
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

               Padding(
                padding: EdgeInsets.only(left: 27, top: 4, bottom: 10),
                child: Text(
                  "Connect your and turn your files & email into audio",
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 10),
                ),
              ),

               Padding(
                padding: EdgeInsets.all(10),
                child: Text("Share"),
              ),

              // Share
              Center(
                child: Container(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.07,
                  padding:  EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black..withAlpha(200),
                        blurRadius: 5,
                        offset:  Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children:  [
                      Icon(CupertinoIcons.share, size: 20),
                      SizedBox(width: 10),
                      Text("Share Listen AI", style: context.textTheme.bodyLarge?.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
              ),

               Padding(
                padding: EdgeInsets.all(10),
                child: Text("Support"),
              ),

              // Support Box
              Center(
                child: Container(
                  width: context.screenWidth * 0.9,
                  height: context.screenHeight * 0.41,
                  padding:  EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black..withAlpha(200),
                        blurRadius: 5,
                        offset:  Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children:  [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.star_border_outlined),
                          ),
                          Text("Like us, Rate us", style: context.textTheme.bodyLarge?.copyWith(fontSize: 18)),
                          SizedBox(width: 5),
                          Icon(Icons.favorite, color: Colors.grey, size: 20),
                        ],
                      ),
                       Divider(),
                      rowItem(Icons.contact_support_outlined, "FAQ & Support"),
                       Divider(),
                      rowItem(Icons.restore_page_outlined, "Restore Purchase"),
                       Divider(),
                      rowItem(Icons.privacy_tip_outlined, "Privacy Policy"),
                       Divider(),
                      rowItem(Icons.sticky_note_2_outlined, "Terms of Service"),
                       Divider(),
                      rowItem(Icons.comment_outlined, "Community Guidelines"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// helper row widget for support section
  
}
