import '../doc_name.dart';

extension ToString on DocName {
  String get stringDefinition {
    switch (this) {
      case DocName.logs:
        return 'logs';
      case DocName.products:
        return 'products';
      case DocName.categories:
        return 'categories';
      case DocName.brands:
        return 'brands';
      case DocName.currencies:
        return 'currencies';
    }
  }
}
