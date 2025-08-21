
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/category_services.dart';
import '/core/theme/app_colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text(
          "Setting",
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10), child: Text("Preferences")),

              // Preferences Box
              PreferencesCard(),


              Padding(padding: EdgeInsets.all(10), child: Text("Support")),

              // Support Box
              SupportDialog(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  /// helper row widget for support section
}
