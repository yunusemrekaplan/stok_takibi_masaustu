class Currency {
  late String? id;
  late String name;

  Currency({
    this.id,
    required this.name,
  });

  factory Currency.fromMap({required Map<String, dynamic> map, String? id}) {
    return Currency(
      id: id,
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
