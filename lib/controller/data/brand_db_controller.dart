import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_doc_name.dart';
import '/model/enum/doc_name.dart';
import '/model/data/brand.dart';
import '../service/firestore_service.dart';

class BrandDbController {
  static final BrandDbController _instance = BrandDbController._internal();

  factory BrandDbController() {
    return _instance;
  }

  BrandDbController._internal();

  RxList<Brand>? brands = <Brand>[].obs;
  final _firestoreDbService = FirestoreDbService();
  final getBrandsErrorMessage = 'Markalar getirilirken bir hata oluştu.';
  final addBrandErrorMessage = 'Marka eklenirken bir hata oluştu.';

  Future<bool> getBrands() async {
    Page<Document>? page = await _firestoreDbService.getPage(
      collectName: DocName.brands.stringDefinition,
    );

    if (page == null) return false;

    brands!.value = page
        .map(
          (e) => Brand.fromMap(map: e.map, id: e.id),
        )
        .toList();

    return true;
  }

  Future<bool> addBrand(Brand brand) async {
    Brand? isContain = isContainBrand(brand.name);
    if (isContain != null) {
      isContain.productCount += brand.productCount;
      return await updateBrand(isContain);
    }

    Document? docuemnt = await _firestoreDbService.addData(
      collectName: DocName.brands.stringDefinition,
      data: brand.toMap(),
    );

    if (docuemnt == null) return false;

    brand.id = docuemnt.id;
    brands!.add(brand);

    return true;
  }

  Future<Brand?> getBrand(String id) async {
    Document? document = await _firestoreDbService.getData(
      collectName: DocName.brands.stringDefinition,
      id: id,
    );

    if (document == null) return null;

    Brand brand = Brand.fromMap(map: document.map, id: document.id);

    return brand;
  }

  Future<bool> updateBrand(Brand brand) async {
    bool state = await _firestoreDbService.updateData(
      collectName: DocName.brands.stringDefinition,
      id: brand.id!,
      data: brand.toMap(),
    );

    return state;
  }

  Brand? isContainBrand(String brandName) {
    for (Brand brand in brands!) {
      if (brand.name.toLowerCase() == brandName.toLowerCase()) {
        return brand;
      }
    }

    return null;
  }
}
