class Brand {
  late String? id;
  late String name;
  late int productCount;

  Brand({
    this.id,
    required this.name,
    required this.productCount,
  });

  factory Brand.fromMap({required Map<String, dynamic> map, String? id}) {
    return Brand(
      id: id,
      name: map['name'],
      productCount: map['productCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'productCount': productCount,
    };
  }
}
