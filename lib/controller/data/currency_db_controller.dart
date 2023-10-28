import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_doc_name.dart';
import '/model/data/currency.dart';
import '/model/enum/doc_name.dart';
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
  final getCurrenciesErrorMessage =
      'Para birimleri getirilirken bir hata oluştu.';

  Future<bool> getCurrencies() async {
    Page<Document>? page = await _firestoreDbService.getData(
      docName: DocName.currencies.stringDefinition,
    );

    if (page == null) return false;

    currencies!.value = page
        .map(
          (e) => Currency.fromMap(map: e.map, id: e.id),
        )
        .toList();

    return true;
  }

  Future<bool> addCurrency(Currency currency) async {
    if (isContainCurrency(currency.name)) {
      return true;
    }

    Document? docuemnt = await _firestoreDbService.addData(
      collectName: DocName.currencies.stringDefinition,
      data: currency.toMap(),
    );

    if (docuemnt == null) return false;

    currency.id = docuemnt.id;
    currencies!.add(currency);

    return true;
  }

  bool isContainCurrency(String currencyName) {
    bool isContain = false;

    for (Currency currency in currencies!) {
      if (currency.name == currencyName) {
        isContain = true;
        break;
      }
    }

    return isContain;
  }
}
