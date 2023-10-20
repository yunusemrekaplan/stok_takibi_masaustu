import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/constant/icon.dart';
import 'package:stok_takibi_masaustu/view/get_controller/theme_controller.dart';

final themeController = Get.find<ThemeController>();

AppBar myAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      Obx(
        () => IconButton(
          onPressed: () {
            themeController.changeTheme();
          },
          icon: themeController.isFirstTheme.value ? lightModeIcon : darkModeIcon,
          iconSize: 30,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
}