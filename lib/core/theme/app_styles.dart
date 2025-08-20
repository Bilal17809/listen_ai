import 'package:flutter/material.dart';
import '../constant/constant.dart';
import 'app_colors.dart';

/*
Use all these for text style
you don't need to style the text
in Ui just call these widget in text style
*/

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


final BoxDecoration premiumDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(20),
  ),
  boxShadow: [
    BoxShadow(
      blurRadius: 6,
      color: Colors.black26,
      offset: Offset(0, -2),
    )
  ],
);
final BoxDecoration proDecoration=BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(8),
);
final BoxDecoration preferencesDecoration=BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.circular(12),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 5,
      offset:  Offset(0, 3),
    ),
  ],
);
final BoxDecoration voiceDecoration=BoxDecoration(
  color: kMediumGreen2,
  borderRadius: BorderRadius.circular(6),
);
final BoxDecoration linkedDecoration=BoxDecoration(
  color: kWhite,
  borderRadius: BorderRadius.circular(12),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 5,
      offset:  Offset(0, 3),
    ),
  ],
);
final BoxDecoration listviewDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 4,
      offset: Offset(0, 2),
    )
  ],
);
final BoxDecoration positionDecoration=BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6,
      offset: Offset(0, -3),
    )
  ],
);