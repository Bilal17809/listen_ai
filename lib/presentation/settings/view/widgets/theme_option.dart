import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/constant/constant.dart';

class ThemeOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(

      decoration: BoxDecoration(
        color: isSelected
            ? iconbdcolor.withAlpha(25)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ?iconbdcolor
              : Theme.of(context).dividerColor,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withAlpha(25),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: isSelected
              ? titleSmallSelected
              : titleSmallNormal,
        ),
        leading: Icon(
          isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: isSelected
              ? iconbdcolor
              : Theme.of(context).iconTheme.color,
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: mobileWidth(context) * 0.04,
          vertical: mobileHeight(context) * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
