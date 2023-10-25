import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/enum/my_route.dart';
import 'package:stok_takibi_masaustu/view/widget/my_app_bar.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _loginController = Get.put(LoginController());

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
            validator: _validator.validatorOfEmail,
            obscureText: false,
          ),
          buildTextFormField(
            controller: _loginController.passwordController,
            visibilityButton: buildVisibilityButton(),
            hintText: passwordHintText,
            validator: _validator.validatorOfPassword,
            obscureText: !_loginController.passwordVisible,
          ),
          buildLoginButton(context),
        ],
      ),
    );
  }
}
