import 'dart:convert';

class ProductIOUserEntity {
  String? id;
  String name;
  ProductIOUserEntity({
    this.id,
    required this.name,
  });

  ProductIOUserEntity copyWith({
    String? id,
    String? name,
  }) {
    return ProductIOUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ProductIOUserEntity.fromMap(Map<String, dynamic> map) {
    return ProductIOUserEntity(
      id: map['id'],
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductIOUserEntity.fromJson(String source) => ProductIOUserEntity.fromMap(json.decode(source));

  @override
  String toString() => 'ProductIOUser(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductIOUserEntity && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
