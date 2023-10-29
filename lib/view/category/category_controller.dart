import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controller/data/product_db_controller.dart';
import '/model/data/category.dart';
import '/model/data/product.dart';
import 'constant.dart';

class CategoryController extends GetxController {
  late Category category;
  Rx<Color> searchIconColor = iconColor.withOpacity(1).obs;
  FocusNode searchFocusNode = FocusNode();

  CategoryController({required this.category}) {
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

  final _productDbController = ProductDbController();
  List<Product>? products = [];

  Future<void> getProducts() async {
    products = _productDbController.products!
        .where((product) => product.category == category.name)
        .toList();
  }
}
