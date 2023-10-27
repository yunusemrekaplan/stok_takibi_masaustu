import '../log_state.dart';

extension ToString on LogState {
  String get stringDefinition {
    switch (this) {
      case LogState.successfulSignIn:
        return 'Successful sign in';
      case LogState.addData:
        return 'Add data';
      case LogState.getData:
        return 'Get data';
      case LogState.setData:
        return 'Set data';
      case LogState.updateData:
        return 'Update data';
      case LogState.getProducts:
        return 'Get products';
      case LogState.addProduct:
        return 'Add product';
      case LogState.updateProduct:
        return 'Update product';
      case LogState.deleteProduct:
        return 'Delete product';
      case LogState.getCategories:
        return 'Get categories';
      case LogState.addCategory:
        return 'Add category';
      case LogState.updateCategory:
        return 'Update category';
      case LogState.deleteCategory:
        return 'Delete category';
      case LogState.getBrands:
        return 'Get brands';
      case LogState.addBrand:
        return 'Add brand';
      case LogState.updateBrand:
        return 'Update brand';
      case LogState.deleteBrand:
        return 'Delete brand';
      case LogState.getCurrencies:
        return 'Get currencies';
      case LogState.addCurrency:
        return 'Add currency';
      case LogState.updateCurrency:
        return 'Update currency';
      case LogState.deleteCurrency:
        return 'Delete currency';
      default:
        return 'Unknown state';
    }
  }
}
