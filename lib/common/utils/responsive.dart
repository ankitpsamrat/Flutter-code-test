import 'package:flutter/material.dart';

class AppUI {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static double dh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double dw(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
