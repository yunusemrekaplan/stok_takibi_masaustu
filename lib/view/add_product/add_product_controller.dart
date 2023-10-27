import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controller/data/currency_db_controller.dart';
import '/controller/data/brand_db_controller.dart';
import '/controller/data/category_db_controller.dart';
import '/model/data/brand.dart';
import '/model/data/category.dart';
import '/model/data/currency.dart';
import '/model/enum/my_route.dart';
import 'constant/constant_enum.dart';

class AddProductController extends GetxController {
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  final _categoryDbController = CategoryDbController();
  final _brandDbController = BrandDbController();
  final _currencyDbController = CurrencyDbController();

  RxList<Category>? categoryList = <Category>[].obs;
  RxList<Brand>? brandList = <Brand>[].obs;
  RxList<Currency>? currencyList = <Currency>[].obs;

  Rx<bool> isValidateFailed = false.obs;

  AutovalidateMode isAutoValidateMode() =>
      isValidateFailed.value ? always : disabled;

  void onChangedDropDownButton(String value, TextEditingController controller) {
    controller.text = value.toString();
    update([MyRoute.addProductScreen]); // setState
  }

  void onPressedAddProductButton() {
    isValidateFailed.value = !formKey.value.currentState!.validate();

    if (!isValidateFailed.value) {
      onAddProduct();
    }
  }

  Future<void> getLists() async {
    categoryList!.value = await _categoryDbController.getCategories();
    brandList!.value = await _brandDbController.getBrands();
    currencyList!.value = await _currencyDbController.getCurrencies();
  }

  void onAddProduct() {
    print('onAddProduct');
    /*
    Product product = Product(
      barcode: barcodeController.text,
      brand: brandController.text,
      model: modelController.text,
      price: double.parse(priceController.text),
      currency: currencyController.text,
      quantity: 0,
    );
    */

    /// ToDo firebase istek gönderen metodu try cathc içine al. Hata vermezse producyList'e ekle.
  }
}
