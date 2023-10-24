import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_my_route.dart';
import '/model/enum/my_route.dart';
import '/view/get_controller/theme_controller.dart';
import '/view/widget/my_app_bar.dart';
import 'add_product_controller.dart';
import 'constant.dart';
import 'widget/my_form_row.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  final AddProductController _addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _addProductController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.addProductScreen.stringDefinition,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(addCategoryAppBarTitle),
      body: buildBody(context),
    );
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: _themeController.dataTableContainerColor.value,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: buildForm(),
          ),
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: _addProductController.formKey,
      autovalidateMode: isAutoValidateMode(),
      child: Column(
        mainAxisAlignment: formMainAxisAlignment,
        children: [
          MyFormRow(
            controller: _addProductController.barcodeController,
            text: barcodeText,
            hintText: barcodeHintText,
          ),
          const SizedBox(height: paddingBoxHeight),
          MyFormRow(
            controller: _addProductController.brandController,
            text: brandText,
            hintText: brandHintText,
          ),
          const SizedBox(height: paddingBoxHeight),
          MyFormRow(
            controller: _addProductController.modelController,
            text: modelText,
            hintText: modelHintText,
          ),
          const SizedBox(height: paddingBoxHeight),
          MyFormRow(
            controller: _addProductController.priceController,
            text: priceText,
            hintText: priceHintText,
          ),
          const SizedBox(height: paddingBoxHeight),
          buildAddProductButtonBox(),
        ],
      ),
    );
  }

  SizedBox buildAddProductButtonBox() {
    return SizedBox(
      width: addProductButtonRowWidth,
      child: Padding(
        padding: addProductButtonPadding,
        child: buildAddProductButton(),
      ),
    );
  }

  ElevatedButton buildAddProductButton() {
    return ElevatedButton(
      onPressed: onPressedAddProductButton,
      child: const Text(addProductButtonText, style: TextStyle(fontSize: addProductButtonTextSize)),
    );
  }

  void onPressedAddProductButton() {
    changeValidateFailedState();

    if (!_addProductController.isValidateFailed) {
      // onAddProduct();
    }
  }

  void changeValidateFailedState() {
    _addProductController
        .changeValidateFailedState(!_addProductController.formKey.currentState!.validate());
  }

  AutovalidateMode isAutoValidateMode() =>
      _addProductController.isValidateFailed ? always : disabled;
}
