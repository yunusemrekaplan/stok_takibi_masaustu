import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

import '/model/data/category.dart';
import '/model/enum/doc_name.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '../service/firestore_service.dart';

class CategoryDbController {
  static final CategoryDbController _instance =
      CategoryDbController._internal();

  factory CategoryDbController() {
    return _instance;
  }

  CategoryDbController._internal();

  RxList<Category>? categories = <Category>[].obs;
  final _firestoreDbService = FirestoreDbService();
  final getCategoriesErrorMessage = 'Kategoriler getirilirken bir hata oluştu.';

  Future<bool> getCategories() async {
    Page<Document>? page = await _firestoreDbService.getData(
      docName: DocName.categories.stringDefinition,
    );

    if (page == null) return false;

    categories!.value = page
        .map(
          (e) => Category.fromMap(map: e.map, id: e.id),
        )
        .toList();

    return true;
  }

  Future<bool> addCategory(Category category) async {
    if (isContainCategory(category.name) != null) {
      return true;
    }
    Document? docuemnt = await _firestoreDbService.addData(
      collectName: DocName.categories.stringDefinition,
      data: category.toMap(),
    );

    if (docuemnt == null) return false;

    category.id = docuemnt.id;
    categories!.add(category);

    return true;
  }

  Future getCategory(String id) async {
    Document? document = await _firestoreDbService.getDocument(
      docName: DocName.categories.stringDefinition,
      id: id,
    );

    if (document == null) return false;

    Category category = Category.fromMap(map: document.map, id: document.id);

    return category;
  }

  Category? isContainCategory(String categoryName) {
    Category? category;

    for (Category category in categories!) {
      if (category.name == categoryName) {
        return category;
      }
    }

    return category;
  }
}
