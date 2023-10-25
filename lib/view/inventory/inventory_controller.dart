import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/data/product.dart';

class InventoryController extends GetxController {
  RxList<Product>? products = <Product>[].obs;
  Rx<Color> searchIconColor = Colors.white.withOpacity(1).obs;
  FocusNode searchFocusNode = FocusNode();

  InventoryController() {
    searchFocusNode.addListener(() {
      if (searchFocusNode.hasFocus) {
        searchIconColor.value = Colors.white.withOpacity(0);
      } else {
        searchIconColor.value = Colors.white.withOpacity(1);
      }
    });
  }
}
