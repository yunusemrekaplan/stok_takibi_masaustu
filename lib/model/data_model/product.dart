class Product {
  final String? id;
  final String? barcode;
  final String name;
  final String? description;
  final String? image;
  final double price;
  final int quantity;

  Product({
    this.id,
    this.barcode,
    required this.name,
    this.description,
    this.image,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        barcode: json['barcode'] ?? '',
        name: json['name'],
        description: json['description'] ?? '',
        image: json['image'] ?? '',
        price: json['price'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'barcode': barcode,
        'name': name,
        'description': description,
        'image': image,
        'price': price,
        'quantity': quantity,
      };
}
