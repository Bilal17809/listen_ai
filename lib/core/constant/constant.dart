import 'package:flutter/cupertino.dart';

const fontFamily = 'Montserrat';
const double kBodyHp=16;

double mobileHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double mobileWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

const EdgeInsets verticalButtonPadding = EdgeInsets.symmetric(vertical: 16);






