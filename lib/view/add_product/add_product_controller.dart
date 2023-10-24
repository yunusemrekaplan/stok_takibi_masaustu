import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/data_model/product.dart';

import '/model/enum/extension/extension_my_route.dart';
import '/model/enum/my_route.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  RxList productList = [].obs;
  List<String> brandList = [
    'Apple',
    'Samsung',
    'Huawei',
  ];

  String? dropdownValue;
  bool isValidateFailed = false;

  void changeValidateFailedState(bool state) {
    isValidateFailed = state;
    update([MyRoute.addProductScreen.stringDefinition]); // setState
  }

  void onChangedDropDownButton(value) {
    dropdownValue = value.toString();
    brandController.text = dropdownValue!;
    update([MyRoute.addProductScreen.stringDefinition]); // setState
  }
}