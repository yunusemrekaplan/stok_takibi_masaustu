// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constant.dart';

class LoginTextFormField extends StatelessWidget {
  LoginTextFormField({
    super.key,
    required this.controller,
    this.visibilityButton,
    required this.hintText,
    required this.validator,
    required this.obscureText,
  });

  late TextEditingController controller;
  IconButton? visibilityButton;
  late String hintText;
  late String? Function(String? value) validator;
  late bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: visibilityButton,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
            width: focusedWidth,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
            width: focusedWidth,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: defaultColor,
            width: defaultWidth,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: defaultColor,
            width: defaultWidth,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: errorColor,
            width: defaultWidth,
          ),
        ),
        constraints: const BoxConstraints.tightFor(
          width: constraintWidth,
          height: constraintHeight,
        ),
      ),
      validator: validator,
      style: loginTextFormFieldStyle,
      obscureText: obscureText,
    );
  }
}
