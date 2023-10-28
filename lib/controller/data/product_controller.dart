import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/product.dart';
import '../service/firestore_service.dart';

class ProductDbController {
  static final ProductDbController _instance = ProductDbController._internal();

  factory ProductDbController() {
    return _instance;
  }

  ProductDbController._internal();

  RxList<Product>? products = <Product>[].obs;
  final _firestoreDbService = FirestoreDbService();

  Future<bool> getProducts() async {
    Page<Document>? page = await _firestoreDbService.getPage(
      collectName: DocName.products.stringDefinition,
    );

    if (page == null) return false;

    products!.value = page
        .map(
          (e) => Product.fromMap(map: e.map, id: e.id),
        )
        .toList();

    return true;
  }

  Future<bool> addProduct(Product product) async {
    Document? docuemnt = await _firestoreDbService.addData(
      collectName: DocName.products.stringDefinition,
      data: product.toMap(),
    );

    if (docuemnt == null) return false;

    product.id = docuemnt.id;
    products!.add(product);

    return true;
  }
}
