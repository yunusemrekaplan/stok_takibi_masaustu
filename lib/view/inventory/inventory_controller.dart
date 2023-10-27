import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controller/data/product_controller.dart';
import '/model/data/product.dart';
import '/view/inventory/constant.dart';

class InventoryController extends GetxController {
  final ProductController _productController = ProductController();
  RxList<Product>? products = <Product>[].obs;
  Rx<Color> searchIconColor = iconColor.withOpacity(1).obs;
  FocusNode searchFocusNode = FocusNode();

  InventoryController() {
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

  Future<void> getProducts() async {
    products!.value = await _productController.getProducts();
  }
}
