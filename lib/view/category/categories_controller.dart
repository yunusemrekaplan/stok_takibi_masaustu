import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/data/category_db_controller.dart';
import '../../model/data/category.dart';
import 'constant.dart';

class CategoriesController extends GetxController {
  final _categoryDbController = CategoryDbController();
  Rx<Color> searchIconColor = iconColor.withOpacity(1).obs;
  FocusNode searchFocusNode = FocusNode();

  CategoriesController() {
    searchFocusNode.addListener(
      () {
        if (searchFocusNode.hasFocus) {
          searchIconColor.value = iconColor.withOpacity(0);
        } else {
          searchIconColor.value = iconColor.withOpacity(1);
        }
      },
    );
  }

  RxList<Category>? get categories => _categoryDbController.categories;

  Future<void> getCategories() async {
    await _categoryDbController.getCategories();
  }
}
