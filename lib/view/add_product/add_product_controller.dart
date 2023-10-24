import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/data_model/product.dart';

import '/model/enum/extension/extension_my_route.dart';
import '/model/enum/my_route.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  List<String> categoryList = [
    'Kulaklık',
    'Şarj Aleti',
    'Klavye',
  ];
  List<String> brandList = [
    'Apple',
    'Samsung',
    'Huawei',
  ];
  List<String> currencyList = [
    'Try',
    'Usd',
    'Eur',
  ];

  bool isValidateFailed = false;

  void changeValidateFailedState(bool state) {
    isValidateFailed = state;
    update([MyRoute.addProductScreen.stringDefinition]); // setState
  }

  void onChangedDropDownButton(String value, TextEditingController controller) {
    //dropdownValue = value.toString();
    controller.text = value.toString();
    update([MyRoute.addProductScreen.stringDefinition]); // setState
  }

  void onAddProduct() {
    Product product = Product(
      barcode: barcodeController.text,
      brand: brandController.text,
      model: modelController.text,
      price: double.parse(priceController.text),
      currency: currencyController.text,
      quantity: 0,
    );

    // firebase istek gönderen metodu try cathc içine al. Hata vermezse producyList'e ekle.
  }
}