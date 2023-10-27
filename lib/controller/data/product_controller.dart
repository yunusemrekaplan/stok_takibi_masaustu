import 'package:get/get.dart';

import '/view/widget/snack_bars.dart';
import '/model/data/log.dart';
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

  final _firestoreDbService = FirestoreDbService();
  final _snackBars = SnackBars();
  final getProductsErrorMessage = 'Ürünler getirilirken bir hata oluştu.';

  Future<List<Product>> getProducts() async {
    List<Product> products = [];

    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.products.stringDefinition,
      );
      products = snapshot
          .map(
            (e) => Product.fromMap(map: e.map, id: e.id),
          )
          .toList();
    } on Exception catch (e) {
      Log(
        dateTime: DateTime.now(),
        state: 'Get Products',
        message: e.toString(),
      );

      _snackBars.buildErrorSnackBar(
        Get.context,
        getProductsErrorMessage,
      );
    }

    return products;
  }
}
