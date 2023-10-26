import 'package:flutter/material.dart';

class ShowDialogs {
  static final ShowDialogs _instance = ShowDialogs._internal();

  factory ShowDialogs() => _instance;

  ShowDialogs._internal();

  Future loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
