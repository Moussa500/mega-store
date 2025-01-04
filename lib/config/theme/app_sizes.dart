import 'package:flutter/material.dart';

class AppSizes {
  static double getDeviceHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
