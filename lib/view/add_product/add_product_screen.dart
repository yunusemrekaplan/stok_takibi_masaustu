import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/get_controller/theme_controller.dart';
import 'package:stok_takibi_masaustu/view/widget/my_app_bar.dart';

import 'add_product_controller.dart';
import 'constant.dart';
import 'widget/my_form_row.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  final AddProductController _addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
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

  Column buildForm() {
    return Column(
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
        buildAddProductButton(),
      ],
    );
  }

  SizedBox buildAddProductButton() {
    return SizedBox(
      width: addProductButtonRowWidth,
      child: Padding(
        padding: addProductButtonPadding,
        child: ElevatedButton(onPressed: () {}, child: const Text(addProductButtonText)),
      ),
    );
  }
}
