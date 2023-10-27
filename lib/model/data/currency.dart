class Currency {
  late String? id;
  late String code;
  late String name;

  Currency({
    this.id,
    required this.code,
    required this.name,
  });

  factory Currency.fromMap({required Map<String, dynamic> map, String? id}) {
    return Currency(
      id: id,
      code: map['code'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
    };
  }
}
