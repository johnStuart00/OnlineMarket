import 'package:flutter/material.dart';

class ScreenUtil {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double setWidth(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }

  static double setHeight(BuildContext context, double percentage) {
    return screenHeight(context) * percentage;
  }
}
