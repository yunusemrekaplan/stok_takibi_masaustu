import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/view/validator.dart';
import '/model/enum/my_route.dart';
import '/view/widget/my_app_bar.dart';
import 'constant.dart';
import 'login_controller.dart';
import 'login_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _loginController = Get.put(LoginController());
  final Validator _validator = Validator();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _loginController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.loginScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Giriş Ekranı'),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.7,
          child: buildLoginForm(context),
        ),
      ),
    );
  }

  Form buildLoginForm(BuildContext context) {
    return Form(
      key: _loginController.formKey,
      autovalidateMode: isAutoValidateMode(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LoginTextFormField(
            controller: _loginController.emailController,
            visibilityButton: null,
            hintText: emailHintText,
            validator: _validator.validateEmail,
            obscureText: false,
          ),
          LoginTextFormField(
            controller: _loginController.passwordController,
            visibilityButton: null,
            hintText: passwordHintText,
            validator: _validator.validatePassword,
            obscureText: !_loginController.passwordVisible,
          ),
          buildLoginButton(context),
        ],
      ),
    );
  }

  ElevatedButton buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _loginController.onPressedLoginButton(context),
      child: const Text(loginButtonText),
    );
  }

  IconButton buildVisibilityButton() {
    return IconButton(
      icon: Icon(_loginController.passwordVisible
          ? Icons.visibility
          : Icons.visibility_off),
      onPressed: _loginController.passwordVisibility,
      color: iconColor,
      highlightColor: transparentColor,
      splashColor: transparentColor,
      hoverColor: transparentColor,
    );
  }

  AutovalidateMode isAutoValidateMode() =>
      _loginController.isValidateFailed ? always : disabled;
}
