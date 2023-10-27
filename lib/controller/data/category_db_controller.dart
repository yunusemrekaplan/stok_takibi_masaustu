import 'package:get/get.dart';

import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/log_state.dart';
import '/view/widget/snack_bars.dart';
import '/model/data/category.dart';
import '/model/enum/doc_name.dart';
import '/model/data/log.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '../service/firestore_service.dart';

class CategoryDbController {
  static final CategoryDbController _instance =
      CategoryDbController._internal();

  factory CategoryDbController() {
    return _instance;
  }

  CategoryDbController._internal();

  final _firestoreDbService = FirestoreDbService();
  final _snackBars = SnackBars();
  final getCategoriesErrorMessage = 'Kategoriler getirilirken bir hata oluştu.';

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
      _snackBars.buildErrorSnackBar(
        Get.context,
        getCategoriesErrorMessage,
      );

      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getCategories.stringDefinition,
        message: e.toString(),
      );

      _firestoreDbService.addData(
        docName: DocName.logs.stringDefinition,
        data: log.toMap(),
      );
    }

    return categories;
  }
}
