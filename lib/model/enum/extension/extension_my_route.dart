import 'package:stok_takibi_masaustu/model/enum/my_route.dart';

extension ToString on MyRoute {
  String get stringDefinition {
    switch (this) {
      case MyRoute.inventoryScreen:
        return '/inventoryScreen';
      case MyRoute.addProductScreen:
        return '/addProductScreen';
      case MyRoute.categoryScreen:
        return '/categoryScreen';
    }
  }
}
