// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constant.dart';

class LoginTextFormField extends StatelessWidget {
  LoginTextFormField({
    super.key,
    required this.controller,
    required this.visibilityButton,
    required this.hintText,
    required this.validator,
    required this.obscureText,
  });

  late TextEditingController controller;
  late IconButton? visibilityButton;
  late String hintText;
  late String? Function(String? value) validator;
  late bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: visibilityButton,
      ),
      validator: validator,
      style: loginTextFormFieldStyle,
      obscureText: obscureText,
    );
  }
}
