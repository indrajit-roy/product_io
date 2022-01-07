import 'dart:convert';

class ProductIONewProduct {
  String itemName;
  double price;
  double discountedPrice;
  double quantity;
  String weightUnit;
  String? category;
  String? description;
  double stockQuantity;
  String stockWeightUnit;
  String? imageFilePath;
  DateTime date;
  ProductIONewProduct(
      {required this.itemName,
      required this.price,
      required this.discountedPrice,
      required this.quantity,
      required this.weightUnit,
      this.category,
      this.description,
      required this.stockQuantity,
      required this.stockWeightUnit,
      this.imageFilePath,
      required this.date});

  ProductIONewProduct copyWith({
    String? itemName,
    double? price,
    double? discountedPrice,
    double? quantity,
    String? weightUnit,
    String? category,
    String? description,
    double? stockQuantity,
    String? stockWeightUnit,
    String? imageFilePath,
    DateTime? date,
  }) {
    return ProductIONewProduct(
        itemName: itemName ?? this.itemName,
        price: price ?? this.price,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        quantity: quantity ?? this.quantity,
        weightUnit: weightUnit ?? this.weightUnit,
        category: category ?? this.category,
        description: description ?? this.description,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        stockWeightUnit: stockWeightUnit ?? this.stockWeightUnit,
        imageFilePath: imageFilePath ?? this.imageFilePath,
        date: date ?? this.date);
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'price': price,
      'discountedPrice': discountedPrice,
      'quantity': quantity,
      'weightUnit': weightUnit,
      'category': category,
      'description': description,
      'stockQuantity': stockQuantity,
      'stockWeightUnit': stockWeightUnit,
      'imageFilePath': imageFilePath,
      'date': date.toIso8601String()
    };
  }

  factory ProductIONewProduct.fromMap(Map<String, dynamic> map) {
    return ProductIONewProduct(
        itemName: map['itemName'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        discountedPrice: map['discountedPrice']?.toDouble() ?? 0.0,
        quantity: map['quantity']?.toDouble() ?? 0.0,
        weightUnit: map['weightUnit'] ?? '',
        category: map['category'],
        description: map['description'],
        stockQuantity: map['stockQuantity']?.toDouble() ?? 0.0,
        stockWeightUnit: map['stockWeightUnit'] ?? '',
        imageFilePath: map['imageFilePath'],
        date: DateTime.tryParse(map['date'] ?? "") ?? DateTime.utc(2022));
  }

  String toJson() => json.encode(toMap());

  factory ProductIONewProduct.fromJson(String source) => ProductIONewProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductIONewProduct(itemName: $itemName, price: $price, discountedPrice: $discountedPrice, quantity: $quantity, weightUnit: $weightUnit, category: $category, description: $description, stockQuantity: $stockQuantity, stockWeightUnit: $stockWeightUnit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductIONewProduct &&
        other.itemName == itemName &&
        other.price == price &&
        other.discountedPrice == discountedPrice &&
        other.quantity == quantity &&
        other.weightUnit == weightUnit &&
        other.category == category &&
        other.description == description &&
        other.stockQuantity == stockQuantity &&
        other.stockWeightUnit == stockWeightUnit &&
        other.imageFilePath == imageFilePath;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        price.hashCode ^
        discountedPrice.hashCode ^
        quantity.hashCode ^
        weightUnit.hashCode ^
        category.hashCode ^
        description.hashCode ^
        stockQuantity.hashCode ^
        stockWeightUnit.hashCode ^
        imageFilePath.hashCode;
  }
}

class ProductIOProduct extends ProductIONewProduct {
  String id;
  String? imageUrl;
  ProductIOProduct(
      {required String itemName,
      required double price,
      required double discountedPrice,
      required double quantity,
      required String weightUnit,
      String? category,
      String? description,
      required double stockQuantity,
      required String stockWeightUnit,
      required this.id,
      String? imageFilePath,
      required DateTime date,
      this.imageUrl})
      : super(
            itemName: itemName,
            price: price,
            discountedPrice: discountedPrice,
            quantity: quantity,
            weightUnit: weightUnit,
            category: category,
            description: description,
            stockQuantity: stockQuantity,
            stockWeightUnit: stockWeightUnit,
            imageFilePath: imageFilePath,
            date: date);

  @override
  ProductIOProduct copyWith(
      {String? id,
      String? itemName,
      double? price,
      double? discountedPrice,
      double? quantity,
      String? weightUnit,
      String? category,
      String? description,
      double? stockQuantity,
      String? stockWeightUnit,
      String? imageFilePath,
      DateTime? date}) {
    return ProductIOProduct.fromNewProduct(id ?? this.id,
        newProduct: super.copyWith(
            itemName: itemName,
            price: price,
            discountedPrice: discountedPrice,
            quantity: quantity,
            weightUnit: weightUnit,
            category: category,
            description: description,
            stockQuantity: stockQuantity,
            stockWeightUnit: stockWeightUnit,
            imageFilePath: imageFilePath,
            date: date));
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
    }..addAll(super.toMap());
  }

  factory ProductIOProduct.fromNewProduct(String id, {required ProductIONewProduct newProduct}) => ProductIOProduct(
      id: id,
      itemName: newProduct.itemName,
      price: newProduct.price,
      discountedPrice: newProduct.discountedPrice,
      quantity: newProduct.quantity,
      weightUnit: newProduct.weightUnit,
      category: newProduct.category,
      description: newProduct.description,
      stockQuantity: newProduct.stockQuantity,
      stockWeightUnit: newProduct.stockWeightUnit,
      imageFilePath: newProduct.imageFilePath,
      date: newProduct.date);

  factory ProductIOProduct.fromMap(Map<String, dynamic> map) {
    return ProductIOProduct.fromNewProduct(map['id'] ?? '', newProduct: ProductIONewProduct.fromMap(map));
  }

  @override
  String toJson() => json.encode(toMap());

  factory ProductIOProduct.fromJson(String source) => ProductIOProduct.fromMap(json.decode(source));

  @override
  String toString() => 'ProductIOProduct(id: $id) ${super.toString()}';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductIOProduct && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
