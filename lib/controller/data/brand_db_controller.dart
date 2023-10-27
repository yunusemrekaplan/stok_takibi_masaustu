import 'package:get/get.dart';

import '/model/data/log.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/brand.dart';
import '/view/widget/snack_bars.dart';
import '../service/firestore_service.dart';
import 'log_db_controller.dart';

class BrandDbController {
  static final BrandDbController _instance = BrandDbController._internal();

  factory BrandDbController() {
    return _instance;
  }

  BrandDbController._internal();

  final _firestoreDbService = FirestoreDbService();
  final _logController = LogDbController();
  final _snackBars = SnackBars();
  final getBrandsErrorMessage = 'Markalar getirilirken bir hata oluştu.';
  final logState = 'Get Brands';

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
      Log log = Log(
        dateTime: DateTime.now(),
        state: logState,
        message: e.toString(),
      );
      _logController.addLog(log.toMap());

      _snackBars.buildErrorSnackBar(
        Get.context,
        getBrandsErrorMessage,
      );
    }

    return brands;
  }
}
