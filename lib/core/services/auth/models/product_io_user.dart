import 'dart:convert';

class ProductIOUser {
  String id;
  String name;
  ProductIOUser({
    required this.id,
    required this.name,
  });

  ProductIOUser copyWith({
    String? id,
    String? name,
  }) {
    return ProductIOUser(
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

  factory ProductIOUser.fromMap(Map<String, dynamic> map) {
    return ProductIOUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductIOUser.fromJson(String source) => ProductIOUser.fromMap(json.decode(source));

  @override
  String toString() => 'ProductIOUser(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductIOUser && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
