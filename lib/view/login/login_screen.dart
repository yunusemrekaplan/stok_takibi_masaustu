import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/validator.dart';
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
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          width: containerWidth,
          height: containerHeight,
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
            hintText: emailHintText,
            validator: _validator.validateEmail,
            obscureText: false,
          ),
          LoginTextFormField(
            controller: _loginController.passwordController,
            visibilityButton: buildVisibilityButton(),
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
      child: const Text(
        loginButtonText,
        style: TextStyle(
          fontSize: loginButtonTextFontSize,
        ),
      ),
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
