import 'package:get/get.dart';

import '/view/widget/snack_bars.dart';
import '/model/data/category.dart';
import '/model/enum/doc_name.dart';
import '/model/data/log.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '../service/firestore_service.dart';
import 'log_db_controller.dart';

class CategoryDbController {
  static final CategoryDbController _instance =
      CategoryDbController._internal();

  factory CategoryDbController() {
    return _instance;
  }

  CategoryDbController._internal();

  final _firestoreDbService = FirestoreDbService();
  final _logController = LogDbController();
  final _snackBars = SnackBars();
  final getCategoriesErrorMessage = 'Kategoriler getirilirken bir hata oluştu.';
  final logState = 'Get Categories';

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];

    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.categories.stringDefinition,
      );
      categories = snapshot
          .map(
            (e) => Category.fromMap(map: e.map, id: e.id),
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
        getCategoriesErrorMessage,
      );
    }

    return categories;
  }
}
