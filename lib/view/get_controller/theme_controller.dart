import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/constant/color.dart';
import 'package:stok_takibi_masaustu/view/theme/theme_first.dart';
import 'package:stok_takibi_masaustu/view/theme/theme_sec.dart';

class ThemeController extends GetxController {
  RxBool isFirstTheme = true.obs;
  Rx<Color> dataTableContainerColor = firstThemeContainerColor.obs;

  void changeTheme() {
    isFirstTheme.value = !isFirstTheme.value;
    if (isFirstTheme.value) {
      Get.changeTheme(themeFirst);
      dataTableContainerColor.value = firstThemeContainerColor;
    } else {
      dataTableContainerColor.value = secThemeContainerColor;
      Get.changeTheme(themeSec);
    }
    print(dataTableContainerColor);
    update();
  }
}
