import 'package:flutter/widgets.dart';
import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/main.dart';
import 'package:rxdart/rxdart.dart';

enum WeightUnit { kilograms, pounds, grams, ounces }

extension WeightUnitExt on WeightUnit {
  String get abbr {
    switch (this) {
      case WeightUnit.kilograms:
        return "kg";
      case WeightUnit.pounds:
        return "lbs";
      case WeightUnit.grams:
        return "gms";
      case WeightUnit.ounces:
        return "oz.";
    }
  }
}

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

  final isUpdating = BehaviorSubject.seeded(false);
  final progress = BehaviorSubject.seeded(0.0);
  Future<void> init() async {}
  void dispose() {
    isUpdating.close();
  }

  void onSubmit() {}
}

class UpdateProductViewModel extends EditProductViewModel {
  final ProductEntity entity;
  UpdateProductViewModel({required this.entity}) {
    itemName = entity.itemName;
    price = entity.price;
    discountedPrice = entity.discountedPrice;
    quantity = entity.quantity;
    description = entity.description;
    category = entity.category;
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
      description != entity.description ||
      category != entity.category ||
      stockQuantity != entity.stockQuantity ||
      stockWeightUnit != entity.stockWeightUnit ||
      imageFilePath != entity.imageFilePath;

  @override
  void onSubmit() async {
    if (_didProductChange) {
      isUpdating.value = true;
      final updatedProduct = await ProductRepository().setProduct(
        oldProduct: entity,
        product: ProductEntity(
            id: entity.id,
            itemName: itemName ?? entity.itemName,
            price: price ?? entity.price,
            discountedPrice: discountedPrice ?? entity.discountedPrice,
            category: category ?? entity.category,
            description: description ?? entity.description,
            quantity: quantity ?? entity.quantity,
            weightUnit: weightUnit,
            stockQuantity: stockQuantity ?? entity.stockQuantity,
            stockWeightUnit: stockWeightUnit,
            imageFilePath: imageFilePath,
            date: DateTime.now()),
        onProgress: (p) => progress.value = p,
      );
      isUpdating.value = false;
      ProductIOUIService.showToast("Changes saved");
      navigatorKey.currentState?.pop<ProductEntity>(updatedProduct);
    } else {
      ProductIOUIService.showToast("No changes recorded");
    }
  }
}
