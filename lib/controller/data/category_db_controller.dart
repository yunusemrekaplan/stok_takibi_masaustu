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
    Page<Document>? page = await _firestoreDbService.getPage(
      collectName: DocName.categories.stringDefinition,
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
    Category? isContain = isContainCategory(category.name);
    if (isContain != null) {
      isContain.productCount += category.productCount;
      return await updateCategory(isContain);
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

  Future<Category?> getCategory(String id) async {
    Document? document = await _firestoreDbService.getData(
      collectName: DocName.categories.stringDefinition,
      id: id,
    );

    if (document == null) return null;

    Category category = Category.fromMap(map: document.map, id: document.id);

    return category;
  }

  Future<bool> updateCategory(Category category) async {
    bool state = await _firestoreDbService.updateData(
      collectName: DocName.categories.stringDefinition,
      id: category.id!,
      data: category.toMap(),
    );

    return state;
  }

  Category? isContainCategory(String categoryName) {
    for (Category category in categories!) {
      if (category.name.toLowerCase() == categoryName.toLowerCase()) {
        return category;
      }
    }

    return null;
  }
}
