import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen_ai/core/extension/extension.dart';

import '/core/theme/app_styles.dart';

class Premium extends StatelessWidget {
  const Premium({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/bg.png", // replace with your image
                fit: BoxFit.cover,
              ),
            ),

            // Main content
            Positioned(
              top: context.screenHeight  * 0.39,
              child: Container(
                width: context.screenWidth,
                height: context.screenHeight  * 0.8,
                decoration: premiumDecoration,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Get Unlimited Access",
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Read anything aloud in top-quality voices",
                      style: context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                    ),

                    // Pro Box
                    Container(
                      width: context.screenWidth * 0.87,
                      height: context.screenHeight  * 0.145,
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.all(12),
                      decoration: proDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Listen AI Pro",
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Unlock Unlimited Listening Experience, Download and Listen Offline, Listen Any Text Document, Best AI Voices Available",
                            style:context.textTheme.bodyLarge?.copyWith(fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Free for 3 days then Rs2250.00/week",
                            style: context.textTheme.bodyLarge?.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Text(
                      "Cancel any time, currently we are not offering free trial",
                      style: context.textTheme.bodyLarge?.copyWith(fontSize: 12),
                    ),

                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms",
                            style: context.textTheme.bodyLarge?.copyWith(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            "Privacy",
                            style: context.textTheme.bodyLarge?.copyWith(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
