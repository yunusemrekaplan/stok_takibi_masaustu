import 'package:get/get.dart';

import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/log_state.dart';
import '/model/data/log.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/brand.dart';
import '/view/widget/snack_bars.dart';
import '../service/firestore_service.dart';

class BrandDbController {
  static final BrandDbController _instance = BrandDbController._internal();

  factory BrandDbController() {
    return _instance;
  }

  BrandDbController._internal();

  final _firestoreDbService = FirestoreDbService();
  final _snackBars = SnackBars();
  final getBrandsErrorMessage = 'Markalar getirilirken bir hata oluştu.';

  Future<List<Brand>> getBrands() async {
    List<Brand> brands = [];

    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.brands.stringDefinition,
      );
      brands = snapshot
          .map(
            (e) => Brand.fromMap(map: e.map, id: e.id),
          )
          .toList();
    } on Exception catch (e) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        getBrandsErrorMessage,
      );

      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getBrands.stringDefinition,
        message: e.toString(),
      );

      _firestoreDbService.addData(
        docName: DocName.logs.stringDefinition,
        data: log.toMap(),
      );
    }

    return brands;
  }
}
