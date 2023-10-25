class Validator {
  static final Validator _instance = Validator._internal();

  factory Validator() => _instance;

  Validator._internal();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  final emailReturnText = 'Lütfen geçerli bir e-posta adresi giriniz.';
  final passwordReturnText = 'Lütfen en az 8 karakter giriniz.';

  String? validateEmail(String? value) {
    bool isValidEmail = emailRegex.hasMatch(value!);
    if (!isValidEmail) {
      return emailReturnText;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return passwordReturnText;
    }
    return null;
  }
}
