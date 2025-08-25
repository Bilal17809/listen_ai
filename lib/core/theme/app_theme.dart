import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

abstract class AppTheme {
  static const fontFamily = 'Montserrat';

  // BUTTON STYLES
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: kWhite,
    textStyle: buttonTextStyle,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 08),
    minimumSize: const Size(double.maxFinite, 50),
    shadowColor: Colors.grey.withValues(alpha: 0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    backgroundColor: kWhite,
    textStyle: buttonTextStyle,
    foregroundColor: kBlack,
    elevation: 4,
    shadowColor: Colors.grey.withValues(alpha: 0.5),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    minimumSize: const Size(double.maxFinite, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    textStyle: buttonTextStyle,
    foregroundColor: kBlack,
    padding: EdgeInsets.zero,
    side: BorderSide.none,
  );

  static final confirmButtonStyle = TextButton.styleFrom(
    foregroundColor: kRed,
    backgroundColor: Colors.transparent,
    textStyle: labelMediumStyle,
    minimumSize: Size(10, 10),
    padding: EdgeInsets.only(bottom: 20),
  );

  static SliderThemeData customSliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: iconbdcolor,
      inactiveTrackColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[700]
          : greyBorderColor,
      thumbColor: iconbdcolor,
      overlayColor: iconbdcolor.withOpacity(0.2),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      activeTickMarkColor: iconbdcolor,
      inactiveTickMarkColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[600]
          : greyBorderColor,
    );
  }

  static const UnderlineInputBorder greyUnderLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: greyBorderColor),
  );

  // LIGHT THEME DATA
  static final ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgColor,
    primaryColor: iconbdcolor,

    // Text Styles
    textTheme: TextTheme(
      headlineMedium: headlineMediumStyle,
      headlineSmall: headlineSmallStyle,
      titleLarge: titleLargeStyle,
      titleMedium: titleMediumStyle,
      titleSmall: titleSmallStyle,
      bodyLarge: bodyLargeStyle,
      bodyMedium: bodyMediumStyle,
      bodySmall: bodySmallStyle,
      labelLarge: labelMediumStyle,
      labelMedium: labelMediumStyle,
      labelSmall: labelSmallStyle,
    ),

    // App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: appBarBgColor,
      elevation: 1,
      titleTextStyle: titleLargeStyle,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
    ),

    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: greyBorderColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: greyBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: iconbdcolor, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kRed),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kRed, width: 2),
      ),
      hintStyle: bodyMediumStyle,
      filled: true,
      fillColor: kWhite,
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: iconbdcolor,
        foregroundColor: kWhite,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: iconbdcolor,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: iconbdcolor,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: BorderSide(color: iconbdcolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // Cards
    cardTheme: const CardThemeData(
      color: kWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: greyBorderColor, width: 0.5),
      ),
    ),

    // Dialogs
    dialogTheme: const DialogThemeData(
      backgroundColor: kWhite,
      titleTextStyle: titleLargeStyle,
      contentTextStyle: bodyMediumStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // Bottom Sheet
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: blackTextColor, size: 24),

    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: iconbdcolor,
      onPrimary: kWhite,
      secondary: kMintGreen,
      onSecondary: kWhite,
      surface: kWhite,
      onSurface: blackTextColor,
      background: bgColor,
      onBackground: blackTextColor,
      error: kRed,
      onError: kWhite,
    ),
  );

  // DARK THEME DATA
  static final ThemeData darkTheme = ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: iconbdcolor,

    // Text Styles
    textTheme: TextTheme(
      headlineMedium: headlineMediumStyle.copyWith(color: kWhite),
      headlineSmall: headlineSmallStyle.copyWith(color: kWhite),
      titleLarge: titleLargeStyle.copyWith(color: kWhite),
      titleMedium: titleMediumStyle.copyWith(color: kWhite),
      titleSmall: titleSmallStyle.copyWith(color: kWhite),
      bodyLarge: bodyLargeStyle.copyWith(color: kWhite),
      bodyMedium: bodyMediumStyle.copyWith(color: kWhite),
      bodySmall: bodySmallStyle.copyWith(color: kWhite),
      labelLarge: labelMediumStyle.copyWith(color: kWhite),
      labelMedium: labelMediumStyle.copyWith(color: kWhite),
      labelSmall: labelSmallStyle.copyWith(color: kWhite),
    ),

    // App Bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 1,
      titleTextStyle: titleLargeStyle,
      iconTheme: IconThemeData(color: kWhite),
      centerTitle: true,
    ),

    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF9E9E9E)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF9E9E9E)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: iconbdcolor, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kRed),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kRed, width: 2),
      ),
      hintStyle: bodyMediumStyle,
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: iconbdcolor,
        foregroundColor: Colors.black,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: iconbdcolor,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: iconbdcolor,
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        side: BorderSide(color: iconbdcolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // Cards
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: Color(0xFF424242), width: 0.5),
      ),
    ),

    // Dialogs
    dialogTheme: const DialogThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      titleTextStyle: titleLargeStyle,
      contentTextStyle: bodyMediumStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // Bottom Sheet
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: kWhite, size: 24),

    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: iconbdcolor,
      onPrimary: Colors.black,
      secondary: kMintGreen,
      onSecondary: Colors.black,
      surface: const Color(0xFF1E1E1E),
      onSurface: kWhite,
      background: const Color(0xFF121212),
      onBackground: kWhite,
      error: kRed,
      onError: kWhite,
    ),

    // Divider
    dividerColor: const Color(0xFF424242),

    // List Tile
    listTileTheme: const ListTileThemeData(
      iconColor: kWhite,
      textColor: kWhite,
    ),
  );
}
