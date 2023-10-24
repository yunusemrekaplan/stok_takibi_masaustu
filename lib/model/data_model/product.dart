class Product {
  final String? id;
  final String? barcode;
  final String brand;
  final String? model;
  final double price;
  final String currency;
  final int quantity;

  Product({
    this.id,
    this.barcode,
    required this.brand,
    this.model,
    required this.price,
    required this.currency,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        barcode: json['barcode'] ?? '',
        brand: json['brand'],
        model: json['model'] ?? '',
        price: json['price'],
        currency: json['currency'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'barcode': barcode,
        'brand': brand,
        'model': model,
        'price': price,
        'currency': currency,
        'quantity': quantity,
      };
}
