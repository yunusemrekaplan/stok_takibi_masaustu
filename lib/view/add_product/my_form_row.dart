// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'add_product_controller.dart';
import 'constant/constant.dart';
import 'constant/constant_double.dart';
import 'constant/constant_enum.dart';
import 'constant/constant_padding.dart';
import 'constant/constant_string.dart';

class MyFormRow extends StatelessWidget {
  MyFormRow({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
    this.isEnableDropDownButton = false,
    this.isDouble = false,
  });

  final _addProductController = Get.find<AddProductController>();

  late TextEditingController controller;
  late String text;
  late String hintText;
  final bool isEnableDropDownButton;
  final bool isDouble;
  final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: formRowMainAxisAlignment,
      children: [
        buildTextBox(),
        buildTextFormField(hintText),
        SizedBox(
          width: dropdownWidth,
          child: isEnableDropDownButton == true ? buildDropDownButton() : null,
        ),
      ],
    );
  }

  SizedBox buildTextBox() {
    return SizedBox(
      width: textBoxWidth,
      height: textBoxHeight,
      child: Text(
        text,
        style: formTextStyle,
      ),
    );
  }

  Padding buildTextFormField(String hintText) {
    return Padding(
      padding: textFormFieldPadding,
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: textFormFieldTextStyle,
        decoration: buildInputDecoration(hintText),
        inputFormatters: isDouble == true ? inputFormatters : null,
      ),
    );
  }

  DropdownButton buildDropDownButton() {
    return DropdownButton(
      value: _addProductController.dropdownValue,
      icon: dropDownIcon,
      iconSize: dropdownIconSize,
      isExpanded: dropdownIsExpanded,
      dropdownColor: dropdownColor,
      hint: const Text(dropdownHintText, style: dropdownHintTextStyle),
      style: dropdownButtonTextStyle,
      padding: dropdownPadding,
      underline: Container(height: dropdownButtonUnderlineHeight, color: underLineColor),
      items: buildDropDownMenuItemList(),
      onChanged: _addProductController.onChangedDropDownButton,
    );
  }

  List<DropdownMenuItem> buildDropDownMenuItemList() {
    return _addProductController.brandList.map(
      (value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value.toString(), style: dropdownItemTextStyle),
        );
      },
    ).toList();
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      border: textFormFieldBorder,
      enabledBorder: textFormFieldEnabledBorder,
      hintText: hintText,
      hintStyle: textFormFieldTextStyle,
      contentPadding: contentPadding,
      constraints: boxConstraints,
    );
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return validatorMessage;
    }
    return null;
  }
}
