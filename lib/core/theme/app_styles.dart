import 'package:flutter/material.dart';
import '../constant/constant.dart';
import 'app_colors.dart';


const double appBarElevation = 1.0;
const EdgeInsets pagePadding = EdgeInsets.all(16);
const double textLineHeight = 1.5;

const TextStyle headlineMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 30,
  fontWeight: FontWeight.w700,
  color: blackTextColor,
);

const TextStyle splashText = TextStyle(
  color: kWhite,
  fontSize: 34,
  fontWeight: FontWeight.bold,
  shadows: [BoxShadow(color: kBlack, blurRadius: 6)],
);

const TextStyle headlineSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleLargeStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle titleSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);

const TextStyle bodyLargeStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle bodyMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: blackTextColor,
);

const TextStyle bodySmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

const TextStyle buttonTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle labelMediumStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);
const TextStyle labelSmallStyle = TextStyle(
  fontFamily: fontFamily,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: blackTextColor,
);
//decoration

//for premium screen
final BoxDecoration premiumscreenroundecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: greyColor.withOpacity(0.14),
);

final BoxDecoration roundedDecorationWithShadow = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);

/*
use this for container decoration
>>> if you need extra then just context. it will
allow you all component
*/
final BoxDecoration roundedDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);
final BoxDecoration roundedbgicondecotion = BoxDecoration(
  color: iconbdcolor,
  borderRadius: BorderRadius.circular(50),
  boxShadow: [BoxShadow(color: kWhite01, blurRadius: 6, offset: Offset(0, 2))],
);
//for home view
final BoxDecoration roundedDecorationHomevie = BoxDecoration(
  gradient: kGradient,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.2),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ],
);
final BoxDecoration roundedGreenBorderDecoration = BoxDecoration(
  color: greenColor.withValues(alpha: 0.3),
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: greenColor, width: 1.0),
);

//home view container decoration

final BoxDecoration rounBorderDecoration = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(08),
    topLeft: Radius.circular(08),
  ),
  border: Border.all(color: kMintGreen),
  boxShadow: [BoxShadow(color: greyColor, blurRadius: 2)],
);

final BoxDecoration rounderGreyBorderDecoration = BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.circular(12),
  border: Border.all(color: greyBorderColor),
);

final boxShadow = BoxShadow(
  color: Colors.grey.withValues(alpha: 0.2),
  blurRadius: 6,
  offset: Offset(0, 2),
);

final BoxDecoration listdecoration = BoxDecoration(
  color: bgcolor,
  borderRadius: BorderRadius.circular(12),
  boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
  ],
);
final InputDecoration translatordecotion = InputDecoration(
  hintText: "Enter text here...",
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(horizontal: 20),
);
/////////////////////////////////////////////////////////////////////////////////////////////
final BoxDecoration greyDragHandleDecoration = BoxDecoration(
  color: greyColor.withAlpha(100),
  borderRadius: BorderRadius.circular(10),
);

final BoxDecoration roundedIconDecoration = BoxDecoration(
  color: iconbdcolor,
  borderRadius: BorderRadius.circular(8),
);

final BoxDecoration bottomNavDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withAlpha(51),
      blurRadius: 6,
      offset: const Offset(0, -2),
    ),
  ],
);

BoxDecoration featureImageDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    borderRadius: BorderRadius.circular(8),
  );
}
BoxDecoration featureCardDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).cardTheme.color,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(30),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ],
  );
}

BoxDecoration featureItemDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).cardTheme.color,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(30),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ],
  );
}
BoxDecoration bottomControlsDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).bottomSheetTheme.backgroundColor,
    border: Border(
      top: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 1,
      ),
    ),
  );
}

Color linearProgressBackground(BuildContext context) {
  return Theme.of(context).dividerColor;
}

const TextStyle titleSmallNormal = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: blackTextColor,
);

 final TextStyle titleSmallSelected = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: iconbdcolor,
);
// text styles
final TextStyle voiceOptionTitleStyle = titleSmallStyle.copyWith(
  fontWeight: FontWeight.normal,
);


TextStyle selectedVoiceOptionTitleStyle(BuildContext context) =>
    titleSmallStyle.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w600,
      fontSize: mobileWidth(context) * 0.04,
    );

TextStyle unselectedVoiceOptionTitleStyle(BuildContext context) =>
    titleSmallStyle.copyWith(
      color: Theme.of(context).textTheme.bodyMedium?.color ?? blackTextColor,
      fontWeight: FontWeight.normal,
      fontSize: mobileWidth(context) * 0.04,
    );


EdgeInsets voiceOptionPadding(BuildContext context) => EdgeInsets.symmetric(
  horizontal: mobileWidth(context) * 0.04,
  vertical: mobileHeight(context) * 0.01,
);


double voiceOptionRadius(BuildContext context) => mobileWidth(context) * 0.03;


List<BoxShadow> voiceOptionShadow(BuildContext context) => [
  BoxShadow(
    color: shadowColor.withOpacity(0.08),
    blurRadius: mobileWidth(context) * 0.02,
    offset: Offset(0, mobileHeight(context) * 0.002),
  ),
];
BoxDecoration defaultCardDecoration(BuildContext context) => BoxDecoration(
  color: Theme.of(context).cardTheme.color,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: shadowColor,
      blurRadius: 10,
      offset:Offset(0, 5),
    ),
  ],
);

BoxDecoration sliderDotDecoration(BuildContext context, bool isActive) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: isActive
        ? (Theme.of(context).brightness == Brightness.dark
        ? kWhite
        : kBlack)
        : Theme.of(context).disabledColor.withValues(alpha: 0.3),
  );
}



