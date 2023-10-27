import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_log_state.dart';
import '/model/enum/log_state.dart';
import '/model/data/log.dart';
import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/product.dart';
import '/view/widget/snack_bars.dart';
import '../service/firestore_service.dart';

class ProductDbController {
  static final ProductDbController _instance = ProductDbController._internal();

  factory ProductDbController() {
    return _instance;
  }

  ProductDbController._internal();

  RxList<Product>? products = <Product>[].obs;
  final _firestoreDbService = FirestoreDbService();
  final _snackBars = SnackBars();
  final getProductsErrorMessage = 'Ürünler getirilirken bir hata oluştu.';
  final addProductErrorMessage = 'Ürün eklenirken bir hata oluştu.';

  Future<void> getProducts() async {
    try {
      final snapshot = await _firestoreDbService.getData(
        docName: DocName.products.stringDefinition,
      );
      products!.value = snapshot
          .map(
            (e) => Product.fromMap(map: e.map, id: e.id),
          )
          .toList();
    } on Exception catch (e) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        getProductsErrorMessage,
      );

      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.getProducts.stringDefinition,
        message: e.toString(),
      );

      _firestoreDbService.addData(
        docName: DocName.logs.stringDefinition,
        data: log.toMap(),
      );
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      Document? docuemnt = await _firestoreDbService.addData(
        docName: DocName.products.stringDefinition,
        data: product.toMap(),
      );
      product.id = docuemnt!.id;
      products!.add(product);
    } on Exception catch (e) {
      _snackBars.buildErrorSnackBar(
        Get.context,
        addProductErrorMessage,
      );

      Log log = Log(
        dateTime: DateTime.now(),
        state: LogState.addProduct.stringDefinition,
        message: e.toString(),
      );

      _firestoreDbService.addData(
        docName: DocName.logs.stringDefinition,
        data: log.toMap(),
      );
    }
  }
}
