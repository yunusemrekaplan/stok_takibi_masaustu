import 'package:stok_takibi_masaustu/model/enum/currency.dart';
import 'package:stok_takibi_masaustu/model/enum/extension/extension_currency.dart';

class Product {
  final String? id;
  final String? barcode;
  final String name;
  final String brand;
  final String? model;
  final String? image;
  final double price;
  final Currency currency;
  final int quantity;

  Product({
    this.id,
    this.barcode,
    required this.name,
    required this.brand,
    this.model,
    this.image,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        barcode: json['barcode'] ?? '',
        name: json['name'],
        brand: json['brand'],
        model: json['model'] ?? '',
        image: json['image'] ?? '',
        price: json['price'],
        currency: json['currency'].currency!,
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'barcode': barcode,
        'brand': brand,
        'name': name,
        'model': model,
        'image': image,
        'price': price,
        'currency': currency.name,
        'quantity': quantity,
      };
}
