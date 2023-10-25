import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  /// ToDo category, brand, currency modeli oluşturulacak. Bu listeleri firebase'den çekilecek.
  List<String> categoryList = [
    'Bilgisayar',
  ];
  List<String> brandList = [];
  List<String> currencyList = [];

  bool isValidateFailed = false;

  void changeValidateFailedState(bool state) {
    isValidateFailed = state;
    update([MyRoute.addProductScreen]); // setState
  }

  void onChangedDropDownButton(String value, TextEditingController controller) {
    controller.text = value.toString();
    update([MyRoute.addProductScreen]); // setState
  }

  void onAddProduct() {
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
