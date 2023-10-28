import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialogs {
  static final ShowDialogs _instance = ShowDialogs._internal();

  factory ShowDialogs() => _instance;

  ShowDialogs._internal();

  Future loadingDialog() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void closeDialog() {
    Get.back();
  }
}
