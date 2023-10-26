class Product {
  final String? id;
  final String? barcode;
  final String category;
  final String brand;
  final String model;
  final double price;
  final String currency;
  final int quantity;

  Product({
    this.id,
    this.barcode,
    required this.category,
    required this.brand,
    required this.model,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  factory Product.fromMap({
    required Map<String, dynamic> map,
    required String id,
  }) =>
      Product(
        id: id,
        barcode: map['barcode'] ?? '',
        category: map['category'],
        brand: map['brand'],
        model: map['model'],
        price: map['price'],
        currency: map['currency'],
        quantity: map['quantity'],
      );

  Map<String, dynamic> toMap() => {
        'barcode': barcode,
        'category': category,
        'brand': brand,
        'model': model,
        'price': price,
        'currency': currency,
        'quantity': quantity,
      };
}
