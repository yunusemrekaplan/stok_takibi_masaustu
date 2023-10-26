import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/auth/user_gateway.dart';

import '../model/data/log.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await _auth.signIn(email, password);
    } catch (e) {
      Log(
        dateTime: DateTime.now(),
        state: 'Sign In Error',
        errorMessage: e.toString(),
      );
    }
    return user;
  }
}
