import 'package:flutter/material.dart';

class AppSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? textColor,
    Color? backgroundColor,
    SnackBarAction? action,
  }) {
    // hide current snackbar before showing a new one
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.green,
        action: action,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
