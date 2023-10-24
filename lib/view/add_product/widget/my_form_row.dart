// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constant.dart';

class MyFormRow extends StatelessWidget {
  MyFormRow({super.key, required this.controller, required this.text, required this.hintText});

  late TextEditingController controller;
  late String text;
  late String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: formRowMainAxisAlignment,
      children: [
        SizedBox(
          width: textBoxWidth,
          child: Text(
            text,
            style: formTextStyle,
          ),
        ),
        buildTextFormField(hintText),
      ],
    );
  }

  Padding buildTextFormField(String hintText) {
    return Padding(
      padding: textFormFieldPadding,
      child: TextFormField(
        controller: controller,
        style: textFormFieldTextStyle,
        decoration: buildInputDecoration(hintText),
      ),
    );
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
