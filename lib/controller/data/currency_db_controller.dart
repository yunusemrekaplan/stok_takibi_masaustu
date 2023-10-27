import 'package:get/get.dart';

import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/log_state.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '/model/data/currency.dart';
import '/model/data/log.dart';
import '/model/enum/doc_name.dart';
import '/view/widget/snack_bars.dart';
import '../service/firestore_service.dart';

class CurrencyDbController {
  static final CurrencyDbController _instance =
      CurrencyDbController._internal();

  factory CurrencyDbController() {
    return _instance;
  }

  CurrencyDbController._internal();

  RxList<Currency>? currencies = <Currency>[].obs;
  final _firestoreDbService = FirestoreDbService();
  final _snackBars = SnackBars();
  final getCurrenciesErrorMessage =
      'Para birimleri getirilirken bir hata oluştu.';

  Future<void> getCurrencies() async {
    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.categories.stringDefinition,
      );
      currencies!.value = snapshot
          .map(
            (e) => Currency.fromMap(map: e.map, id: e.id),
          )
          .toList();
    } on Exception catch (e) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        getCurrenciesErrorMessage,
      );

      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getCurrencies.stringDefinition,
        message: e.toString(),
      );

      _firestoreDbService.addData(
        docName: DocName.logs.stringDefinition,
        data: log.toMap(),
      );
    }
  }
}
