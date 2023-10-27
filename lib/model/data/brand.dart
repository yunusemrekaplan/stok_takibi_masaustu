class Brand {
  late String? id;
  late String code;
  late String name;
  late int productCount;

  Brand({
    this.id,
    required this.code,
    required this.name,
    required this.productCount,
  });

  factory Brand.fromMap({required Map<String, dynamic> map, String? id}) {
    return Brand(
      id: id,
      code: map['code'],
      name: map['name'],
      productCount: map['productCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'productCount': productCount,
    };
  }
}
