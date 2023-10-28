import 'package:flutter/material.dart';

import 'constant.dart';

class SnackBars {
  static final SnackBars _instance = SnackBars._internal();

  factory SnackBars() => _instance;

  SnackBars._internal();

  void buildSnackBar(
    BuildContext? context,
    String message,
    Color backgroundColor,
  ) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: snackBarDuration),
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: snackBarTextFontSize,
            color: textColor,
          ),
        ),
        showCloseIcon: true,
        closeIconColor: closeIconColor,
      ),
    );
  }

  void buildErrorSnackBar(
    BuildContext? context,
    String message,
  ) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: snackBarDuration),
        backgroundColor: snackBarErrorColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: snackBarTextFontSize,
            color: textColor,
          ),
        ),
        showCloseIcon: true,
        closeIconColor: closeIconColor,
      ),
    );
  }

  void buildSuccessSnackBar(
    BuildContext? context,
    String message,
  ) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: snackBarDuration),
        backgroundColor: snackBarSuccessColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: snackBarTextFontSize,
            color: textColor,
          ),
        ),
        showCloseIcon: true,
        closeIconColor: closeIconColor,
      ),
    );
  }
}
