import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/enum/my_route.dart';
import '../theme/theme_controller.dart';
import '/view/widget/my_app_bar.dart';
import 'add_product_controller.dart';
import 'constant/constant.dart';
import 'constant/constant_double.dart';
import 'constant/constant_enum.dart';
import 'constant/constant_padding.dart';
import 'constant/constant_string.dart';
import 'my_form_row.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final _themeController = Get.find<ThemeController>();
  final _addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _addProductController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.addProductScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(addProductAppBarTitle),
      body: FutureBuilder(
        future: _addProductController.getLists(),
        builder: builder,
      ),
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return buildBody(context);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width * containerWidth,
          height: MediaQuery.of(context).size.height * containerHeight,
          decoration: BoxDecoration(
            color: _themeController.containerColor.value,
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
      key: _addProductController.formKey.value,
      autovalidateMode: _addProductController.isAutoValidateMode(),
      child: Column(
        mainAxisAlignment: formMainAxisAlignment,
        children: buildFromChildren,
      ),
    );
  }

  List<Widget> get buildFromChildren {
    return [
      MyFormRow(
        controller: _addProductController.categoryController,
        text: categoryText,
        hintText: categoryHintText,
        dropdownHintText: dropdownCategoryHintText,
        isEnableDropDownButton: true,
        dropdownList:
            _addProductController.categories!.map((e) => e.name).toList(),
      ),
      const SizedBox(height: paddingBoxHeight),
      MyFormRow(
        controller: _addProductController.brandController,
        text: brandText,
        hintText: brandHintText,
        dropdownHintText: dropdownBrandHintText,
        isEnableDropDownButton: true,
        dropdownList: _addProductController.brands!.map((e) => e.name).toList(),
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
        isInteger: true,
      ),
      const SizedBox(height: paddingBoxHeight),
      MyFormRow(
        controller: _addProductController.currencyController,
        text: currencyText,
        hintText: currencyHintText,
        dropdownHintText: dropdownCurrencyHintText,
        isEnableDropDownButton: true,
        dropdownList:
            _addProductController.currencies!.map((e) => e.name).toList(),
      ),
      MyFormRow(
        controller: _addProductController.quantityController,
        text: quantityText,
        hintText: quantityHintText,
        isInteger: true,
      ),
      const SizedBox(height: paddingBoxHeight),
      buildAddProductButtonBox(),
    ];
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
      onPressed: _addProductController.onPressedAddProductButton,
      child: const Text(
        addProductButtonText,
        style: TextStyle(fontSize: addProductButtonTextSize),
      ),
    );
  }
}
