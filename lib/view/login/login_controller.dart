import 'package:firedart/auth/user_gateway.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/data/log.dart';
import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/extension/extension_my_route.dart';
import '/controller/service/auth_service.dart';
import '/controller/service/firestore_service.dart';
import '/controller/data/log_db_controller.dart';
import '/model/enum/log_state.dart';
import '/model/enum/my_route.dart';
import '../widget/show_dialogs.dart';
import '../widget/snack_bars.dart';
import 'constant.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final _logController = LogDbController();
  final ShowDialogs _showDialogs = ShowDialogs();
  final SnackBars _snackBars = SnackBars();
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
    _showDialogs.loadingDialog(context);

    User? user = await _authService.signIn(
      email: emailController.text,
      password: passwordController.text,
    );

    user == null ? onLoginFailed() : onLoginSuccessful(user);
  }

  void onLoginFailed() {
    Get.back();
    _snackBars.buildSnackBar(
      Get.context,
      loginFailedMessage,
      snackBarFailedColor,
    );
  }

  void onLoginSuccessful(User user) {
    FirestoreDbService(id: user.id);
    Log log = Log(
      dateTime: DateTime.now(),
      state: LogState.successfulSignIn.stringDefinition,
      message: LogState.successfulSignIn.messageDefinition,
    );

    _logController.addLog(log.toMap());

    /*
    FirestoreDbService().addData(
      docName: DocName.products.stringDefinition,
      data: Product(
        barcode: '1234567890',
        category: 'Kulaklık',
        brand: 'Apple',
        model: 'A21',
        price: 20,
        currency: 'Usd',
        quantity: 13,
      ).toMap(),
    );*/

    Get.offAllNamed(MyRoute.inventoryScreen.stringDefinition);
  }
}
