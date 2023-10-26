import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/theme/theme_controller.dart';

import 'constant.dart';

final _themeController = Get.find<ThemeController>();

AppBar myAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      Obx(
        () => IconButton(
          onPressed: () {
            _themeController.changeTheme();
          },
          icon: _themeController.isFirstTheme.value
              ? lightModeIcon
              : darkModeIcon,
          iconSize: 30,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
}
