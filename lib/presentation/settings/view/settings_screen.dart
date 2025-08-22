import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Settings",
          style: titleLargeStyle.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Speaker Voice",
              style: titleMediumStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Obx(() {
              return Column(
                children: [
                  _buildVoiceOption(
                    controller: controller,
                    title: "Female",
                    value: "female",
                    groupValue: controller.selectedVoice,
                    onTap: () => controller.setVoice("female"),
                  ),
                  const SizedBox(height: 12),
                  _buildVoiceOption(
                    controller: controller,
                    title: "Male",
                    value: "male",
                    groupValue: controller.selectedVoice,
                    onTap: () => controller.setVoice("male"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceOption({
    required SettingsController controller,
    required String title,
    required String value,
    required String groupValue,
    required VoidCallback onTap,
  }) {
    final bool isSelected = groupValue == value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.1) : kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? primaryColor : greyBorderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? primaryColor : greyColor,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: titleSmallStyle.copyWith(
                color: isSelected ? primaryColor : blackTextColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}