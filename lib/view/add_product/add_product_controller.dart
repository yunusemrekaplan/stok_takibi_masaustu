import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/show_dialogs.dart';
import '../widget/snack_bars.dart';
import '/controller/data/product_db_controller.dart';
import '/controller/data/currency_db_controller.dart';
import '/controller/data/brand_db_controller.dart';
import '/controller/data/category_db_controller.dart';
import '/model/data/brand.dart';
import '/model/data/category.dart';
import '/model/data/currency.dart';
import '/model/data/product.dart';
import 'constant/constant_enum.dart';
import 'constant/constant_string.dart';

class AddProductController extends GetxController {
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final barcodeController = TextEditingController();
  final categoryController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final priceController = TextEditingController();
  final currencyController = TextEditingController();
  final quantityController = TextEditingController();

  final _productDbController = ProductDbController();
  final _categoryDbController = CategoryDbController();
  final _brandDbController = BrandDbController();
  final _currencyDbController = CurrencyDbController();
  final _snackBars = SnackBars();
  final _showDialogs = ShowDialogs();

  Rx<bool> isValidateFailed = false.obs;

  RxList<Category>? get categories => _categoryDbController.categories;
  RxList<Brand>? get brands => _brandDbController.brands;
  RxList<Currency>? get currencies => _currencyDbController.currencies;

  Product get _product {
    return Product(
      barcode: barcodeController.text,
      category: categoryController.text,
      brand: brandController.text,
      model: modelController.text,
      price: double.parse(priceController.text),
      currency: currencyController.text,
      quantity: int.parse(quantityController.text),
    );
  }

  Future<void> getLists() async {
    bool categoryState = await _categoryDbController.getCategories();
    bool brandState = await _brandDbController.getBrands();
    bool currencyState = await _currencyDbController.getCurrencies();

    if (!categoryState || !brandState || !currencyState) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        getListsErrorMessage,
      );
    }
  }

  AutovalidateMode isAutoValidateMode() =>
      isValidateFailed.value ? always : disabled;

  void onChangedDropDownButton(String value, TextEditingController controller) {
    controller.text = value.toString();
  }

  Future<void> onPressedAddProductButton() async {
    isValidateFailed.value = !formKey.value.currentState!.validate();

    if (!isValidateFailed.value) {
      _showDialogs.loadingDialog();
      await addProduct();
    }
  }

  Future<void> addProduct() async {
    Product product = _product;
    bool state = await _productDbController.addProduct(product);

    if (state) {
      await _categoryDbController.addCategory(Category(
        name: categoryController.text,
        productCount: product.quantity,
      ));

      await _brandDbController.addBrand(Brand(
        name: brandController.text,
        productCount: product.quantity,
      ));

      await _currencyDbController.addCurrency(Currency(
        name: currencyController.text,
      ));

      onClear();

      _snackBars.buildSuccessSnackBar(
        Get.context,
        addProductSuccessMessage,
      );
    } else {
      _snackBars.buildErrorSnackBar(
        Get.context,
        addProductErrorMessage,
      );
    }

    _showDialogs.closeDialog();
    // update([MyRoute.addProductScreen]);

    /// ToDo firebase istek gönderen metodu try cathc içine al. Hata vermezse producyList'e ekle.
  }

  onClear() {
    barcodeController.clear();
    categoryController.clear();
    brandController.clear();
    modelController.clear();
    priceController.clear();
    currencyController.clear();
    quantityController.clear();
  }
}
