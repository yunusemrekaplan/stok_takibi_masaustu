import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/enum/my_route.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isValidateFailed = false;
  bool passwordVisible = false;

  void changeValidateFailedState(bool state) {
    isValidateFailed = state;
    update([MyRoute.loginScreen]); // setState
  }

  void passwordVisibility() {
    passwordVisible = !passwordVisible;
    update([MyRoute.loginScreen]); // setState
  }
}
