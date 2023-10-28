// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widget/validator.dart';
import 'add_product_controller.dart';
import 'constant/constant.dart';
import 'constant/constant_color.dart';
import 'constant/constant_double.dart';
import 'constant/constant_enum.dart';
import 'constant/constant_padding.dart';
import 'constant/constant_text_style.dart';

class MyFormRow extends StatelessWidget {
  MyFormRow({
    super.key,
    required this.controller,
    required this.text,
    required this.hintText,
    this.isEnableDropDownButton = false,
    this.dropdownHintText,
    this.isInteger = false,
    this.dropdownList = const [],
  });

  final _addProductController = Get.find<AddProductController>();
  final _validator = Validator();

  final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
  ];
  final bool isEnableDropDownButton;
  final bool isInteger;

  late TextEditingController controller;
  late String text;
  late String hintText;
  late String? dropdownHintText;
  late List<String> dropdownList;

  @override
  Widget build(BuildContext context) {
    return buildRow();
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: formRowMainAxisAlignment,
      children: [
        buildTextBox(),
        buildTextFormField(hintText),
        buildDropDownButtonOrContainer(),
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
        validator: _validator.validateEmpty,
        style: textFormFieldTextStyle,
        decoration: buildInputDecoration(hintText),
        inputFormatters: isInteger == true ? inputFormatters : null,
      ),
    );
  }

  Widget buildDropDownButtonOrContainer() {
    return (isEnableDropDownButton == true
        ? (dropdownList.isNotEmpty
            ? buildDropdownButtonBox()
            : Container(width: dropdownWidth))
        : Container(width: dropdownWidth));
  }

  SizedBox buildDropdownButtonBox() {
    return SizedBox(
      width: dropdownWidth,
      child: buildDropDownButton(),
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
}
