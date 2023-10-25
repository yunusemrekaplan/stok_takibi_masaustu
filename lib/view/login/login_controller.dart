import 'package:firedart/auth/user_gateway.dart';
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

  void onPressedLoginButton(BuildContext context) {
    changeValidateFailedState(!formKey.currentState!.validate());

    // If there is no TextFormField validation error, the login process is performed.
    if (!isValidateFailed) {
      onLogin(context);
    }
  }

  void onLogin(BuildContext context) async {
    /*
    _showDialogs.loadingDialog(context);

    User? user = await _authService.signIn(
      email: loginController.emailController.text,
      password: loginController.passwordController.text,
    );

    user == null ? onLoginFailed() : onLoginSuccessful(user);*/
  }

  void onLoginFailed() {
    Get.back();
    //_snackBars.buildSnackBar(Get.context, loginFailedMessage, Colors.red);
  }

  void onLoginSuccessful(User user) {
    // veri ekleme kodu // bir sınıfa ata // ToDo: silinecek
    //FirestoreDbService(id: user.id);
    Get.back();
    // buildSnackBar(Get.context, 'Login successful', Colors.green);
    Get.offNamed("/home");
  }
}
