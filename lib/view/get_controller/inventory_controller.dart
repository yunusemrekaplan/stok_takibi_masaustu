import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/data_model/product.dart';

class InventoryController extends GetxController {
  final List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    update();
  }

  void removeProduct(Product product) {
    products.remove(product);
    update();
  }

  void updateProduct(Product product) {
    products[products.indexWhere((element) => element.id == product.id)] = product;
    update();
  }

  void clearProducts() {
    products.clear();
    update();
  }

  void sortProducts(int index) {
    if (index == 0) {
      products.sort((a, b) => a.barcode!.compareTo(b.barcode!));
    }
    products.sort((a, b) => a.name.compareTo(b.name));
    update();
  }
}
