import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/constant.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../bottom_nav/view/bottom_nav.dart';
import '../controller/settings_controller.dart';
import 'setting.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: mobileWidth(context) * 0.05,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? iconbdcolor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).appBarTheme.iconTheme?.color ?? Colors.black87),
          onPressed: () async {
            Get.offNamed(AppRoutes.home);
          },
        ),
      ),
      body: Obx(() {
        if (settingsController.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
          );
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(mobileWidth(context) * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: "Theme"),
              SizedBox(height: mobileHeight(context) * 0.02),
              Column(
                children: [
                  ThemeOption(
                    title: "Light Mode",
                    isSelected: !settingsController.isDarkMode,
                    onTap: settingsController.toggleTheme,
                  ),
                  SizedBox(height: mobileHeight(context) * 0.015),
                  ThemeOption(
                    title: "Dark Mode",
                    isSelected: settingsController.isDarkMode,
                    onTap: settingsController.toggleTheme,
                  ),
                ],
              ),
              SizedBox(height: mobileHeight(context) * 0.03),
              const SectionHeader(title: "Speaker Voice"),
              SizedBox(height: mobileHeight(context) * 0.02),
              Column(
                children: [
                  VoiceOption(
                    title: "Female Voice",
                    value: "female",
                    groupValue: settingsController.selectedVoice,
                    onTap: () => settingsController.setVoice("female"),
                  ),
                  SizedBox(height: mobileHeight(context) * 0.015),
                  VoiceOption(
                    title: "Male Voice",
                    value: "male",
                    groupValue: settingsController.selectedVoice,
                    onTap: () => settingsController.setVoice("male"),
                  ),
                ],
              ),
              SizedBox(height: mobileHeight(context) * 0.03),
              const SectionHeader(title: "Volume Level"),
              SizedBox(height: mobileHeight(context) * 0.02),
              SliderSetting(
                label: "Volume",
                value: settingsController.volumeLevel,
                onChanged: settingsController.setVolume,
                min: 0.0,
                max: 1.0,
                divisions: 10,
              ),
              SizedBox(height: mobileHeight(context) * 0.03),
              const SectionHeader(title: "Speech Speed"),
              SizedBox(height: mobileHeight(context) * 0.02),
              SliderSetting(
                label: "Speed",
                value: settingsController.speechSpeed,
                onChanged: settingsController.setSpeechSpeed,
                min: 0.5,
                max: 2.0,
                divisions: 15,
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
          boxShadow: [BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 6,
            offset: const Offset(0, -2),
          )],
        ),
        child: MainBottomBar(),
      ),
    );
  }
}