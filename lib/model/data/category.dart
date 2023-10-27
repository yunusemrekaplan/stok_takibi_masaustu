class Category {
  final String? id;
  final String code;
  final String name;
  final int productCount;

  Category({
    this.id,
    required this.code,
    required this.name,
    required this.productCount,
  });

  factory Category.fromMap({
    required Map<String, dynamic> map,
    required String id,
  }) =>
      Category(
        id: id,
        code: map['code'],
        name: map['name'],
        productCount: map['productCount'],
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'name': name,
        'productCount': productCount,
      };
}
