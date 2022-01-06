import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';

class NewProductEntity {
  final String itemName;
  final double price;
  final double discountedPrice;
  final double quantity;
  final WeightUnit weightUnit;
  final String? category;
  final String? description;
  final double stockQuantity;
  final WeightUnit stockWeightUnit;
  NewProductEntity({
    required this.itemName,
    required this.price,
    required this.discountedPrice,
    required this.quantity,
    required this.weightUnit,
    this.category,
    this.description,
    required this.stockQuantity,
    required this.stockWeightUnit,
  });
}

class ProductEntity extends NewProductEntity {
  final String id;
  ProductEntity({
    required this.id,
    required String itemName,
    required double price,
    required double discountedPrice,
    required double quantity,
    required WeightUnit weightUnit,
    String? category,
    String? description,
    required double stockQuantity,
    required WeightUnit stockWeightUnit,
  }) : super(
            itemName: itemName,
            price: price,
            discountedPrice: discountedPrice,
            quantity: quantity,
            weightUnit: weightUnit,
            category: category,
            description: description,
            stockQuantity: stockQuantity,
            stockWeightUnit: stockWeightUnit);
}
