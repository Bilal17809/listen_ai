import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class VoiceOption extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final VoidCallback onTap;

  const VoiceOption({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = groupValue == value;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary.withAlpha(26)
            : Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(voiceOptionRadius(context)),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).dividerColor ?? greyBorderColor,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: voiceOptionShadow(context),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: groupValue,
        onChanged: (String? newValue) {
          if (newValue != null) onTap();
        },
        activeColor: Theme.of(context).colorScheme.primary,
        title: Text(
          title,
          style: isSelected
              ? selectedVoiceOptionTitleStyle(context)
              : unselectedVoiceOptionTitleStyle(context),
        ),
        contentPadding: voiceOptionPadding(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(voiceOptionRadius(context)),
        ),
      ),
    );
  }
}
