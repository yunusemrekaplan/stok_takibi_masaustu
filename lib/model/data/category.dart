class Category {
  late String? id;
  late String name;
  late int productCount;

  Category({
    this.id,
    required this.name,
    required this.productCount,
  });

  factory Category.fromMap({
    required Map<String, dynamic> map,
    required String id,
  }) =>
      Category(
        id: id,
        name: map['name'],
        productCount: map['productCount'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'productCount': productCount,
      };
}
