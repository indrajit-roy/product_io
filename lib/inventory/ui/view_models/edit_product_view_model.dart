import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/main.dart';

enum WeightUnit { kilograms, pounds, grams, ounces }

class EditProductViewModel {
  String? itemName;
  double? price;
  double? discountedPrice;
  double? quantity;
  WeightUnit weightUnit = WeightUnit.kilograms;
  String? category;
  String? description;
  double? stockQuantity;
  WeightUnit stockWeightUnit = WeightUnit.kilograms;
  String? imageFilePath;

  Future<void> init() async {}
  void dispose() {}

  void onSubmit() {}
}

class UpdateProductViewModel extends EditProductViewModel {
  final ProductEntity entity;
  UpdateProductViewModel({required this.entity}) {
    itemName = entity.itemName;
    price = entity.price;
    discountedPrice = entity.discountedPrice;
    quantity = entity.quantity;
    weightUnit = entity.weightUnit;
    stockQuantity = entity.stockQuantity;
    stockWeightUnit = entity.stockWeightUnit;
    imageFilePath = entity.imageFilePath;
  }

  bool get _didProductChange =>
      itemName != entity.itemName ||
      price != entity.price ||
      discountedPrice != entity.discountedPrice ||
      quantity != entity.quantity ||
      weightUnit != entity.weightUnit ||
      stockQuantity != entity.stockQuantity ||
      stockWeightUnit != entity.stockWeightUnit ||
      imageFilePath != entity.imageFilePath;

  @override
  void onSubmit() async {
    if (_didProductChange) {
      final updatedProduct = await ProductRepository().setProduct(
          oldProduct: entity,
          product: ProductEntity(
              id: entity.id,
              itemName: itemName ?? entity.itemName,
              price: price ?? entity.price,
              discountedPrice: discountedPrice ?? entity.discountedPrice,
              quantity: quantity ?? entity.quantity,
              weightUnit: weightUnit,
              stockQuantity: stockQuantity ?? entity.stockQuantity,
              stockWeightUnit: stockWeightUnit,
              imageFilePath: imageFilePath));
      ProductIOUIService.showToast("Changes saved");
      navigatorKey.currentState?.pop<ProductEntity>(updatedProduct);
    } else {
      ProductIOUIService.showToast("No changes recorded");
    }
  }
}
