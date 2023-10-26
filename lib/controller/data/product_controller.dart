import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/product.dart';
import '../service/firestore_service.dart';

class ProductController {
  static final ProductController _instance = ProductController._internal();

  factory ProductController() {
    return _instance;
  }

  ProductController._internal();

  final FirestoreDbService _firestoreDbService = FirestoreDbService();

  Future<List<Product>> getProduct() async {
    final snapshot = await _firestoreDbService.getData(
      docName: DocName.products.stringDefinition,
    );
    return snapshot
        .map(
          (e) => Product.fromMap(map: e.map, id: e.id),
        )
        .toList();
  }
}
