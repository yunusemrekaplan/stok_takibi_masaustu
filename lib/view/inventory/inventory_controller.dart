import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/snack_bars.dart';
import '/controller/data/product_controller.dart';
import '/model/data/product.dart';
import '/view/inventory/constant.dart';

class InventoryController extends GetxController {
  final _productController = ProductDbController();
  final _snackBars = SnackBars();

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

  RxList<Product>? get products => _productController.products;

  Future<void> getProducts() async {
    bool state = await _productController.getProducts();

    if (!state) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        getProductsErrorMessage,
      );
    }
  }
}
