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
    this.dropdownHintText,
    this.isDouble = false,
    this.dropdownList = const [],
  });

  final _addProductController = Get.find<AddProductController>();
  final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
  ];
  final bool isEnableDropDownButton;
  final bool isDouble;

  late TextEditingController controller;
  late String text;
  late String hintText;
  late String? dropdownHintText;
  late List<String> dropdownList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: formRowMainAxisAlignment,
      children: [
        buildTextBox(),
        buildTextFormField(hintText),

        /// ToDo bozuk
        (isEnableDropDownButton == true
            ? (dropdownList.isNotEmpty ? buildDropdownButtonBox() : Container())
            : Container()),
      ],
    );
  }

  SizedBox buildDropdownButtonBox() {
    return SizedBox(
      width: dropdownWidth,
      child: buildDropDownButton(),
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
      icon: dropDownIcon,
      iconSize: dropdownIconSize,
      isExpanded: dropdownIsExpanded,
      dropdownColor: dropdownColor,
      hint: Text(dropdownHintText!, style: dropdownHintTextStyle),
      style: dropdownButtonTextStyle,
      padding: dropdownPadding,
      underline: Container(
          height: dropdownButtonUnderlineHeight, color: underLineColor),
      items: buildDropDownMenuItemList(),
      onChanged: (value) =>
          _addProductController.onChangedDropDownButton(value, controller),
    );
  }

  List<DropdownMenuItem> buildDropDownMenuItemList() {
    return dropdownList.map(
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
