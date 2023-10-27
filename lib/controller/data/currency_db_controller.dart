import 'package:get/get.dart';

import '/model/enum/extension/extension_doc_name.dart';
import '/model/data/currency.dart';
import '/model/data/log.dart';
import '/model/enum/doc_name.dart';
import '/view/widget/snack_bars.dart';
import '../service/firestore_service.dart';
import 'log_db_controller.dart';

class CurrencyDbController {
  static final CurrencyDbController _instance =
      CurrencyDbController._internal();

  factory CurrencyDbController() {
    return _instance;
  }

  CurrencyDbController._internal();

  final _firestoreDbService = FirestoreDbService();
  final _logController = LogDbController();
  final _snackBars = SnackBars();
  final getCurrenciesErrorMessage =
      'Para birimleri getirilirken bir hata oluştu.';
  final logState = 'Get Currencies';

  Future<List<Currency>> getCurrencies() async {
    List<Currency> currencies = [];

    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.categories.stringDefinition,
      );
      currencies = snapshot
          .map(
            (e) => Currency.fromMap(map: e.map, id: e.id),
          )
          .toList();
    } on Exception catch (e) {
      Log log = Log(
        dateTime: DateTime.now(),
        state: logState,
        message: e.toString(),
      );
      _logController.addLog(log.toMap());

      _snackBars.buildErrorSnackBar(
        Get.context,
        getCurrenciesErrorMessage,
      );
    }

    return currencies;
  }
}
