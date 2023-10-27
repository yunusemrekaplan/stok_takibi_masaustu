import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controller/data/product_controller.dart';
import '/controller/data/currency_db_controller.dart';
import '/controller/data/brand_db_controller.dart';
import '/controller/data/category_db_controller.dart';
import '/model/data/brand.dart';
import '/model/data/category.dart';
import '/model/data/currency.dart';
import '/model/data/product.dart';
import '/model/enum/my_route.dart';
import 'constant/constant.dart';
import 'constant/constant_enum.dart';

class AddProductController extends GetxController {
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final _productDbController = ProductDbController();
  final _categoryDbController = CategoryDbController();
  final _brandDbController = BrandDbController();
  final _currencyDbController = CurrencyDbController();

  Rx<bool> isValidateFailed = false.obs;

  RxList<Category>? get categories => _categoryDbController.categories;
  RxList<Brand>? get brands => _brandDbController.brands;
  RxList<Currency>? get currencies => _currencyDbController.currencies;

  Future<void> getLists() async {
    await _categoryDbController.getCategories();
    await _brandDbController.getBrands();
    await _currencyDbController.getCurrencies();
  }

  AutovalidateMode isAutoValidateMode() =>
      isValidateFailed.value ? always : disabled;

  void onChangedDropDownButton(String value, TextEditingController controller) {
    controller.text = value.toString();
    update([MyRoute.addProductScreen]); // setState
  }

  Future<void> onPressedAddProductButton() async {
    isValidateFailed.value = !formKey.value.currentState!.validate();

    if (!isValidateFailed.value) {
      await onAddProduct();
    }
  }

  Future<void> onAddProduct() async {
    Product product = Product(
      barcode: barcodeController.text,
      category: categoryController.text,
      brand: brandController.text,
      model: modelController.text,
      price: double.parse(priceController.text),
      currency: currencyController.text,
      quantity: 0,
    );

    await _productDbController.addProduct(product);

    // update([MyRoute.addProductScreen]);

    /// ToDo firebase istek gönderen metodu try cathc içine al. Hata vermezse producyList'e ekle.
  }
}
