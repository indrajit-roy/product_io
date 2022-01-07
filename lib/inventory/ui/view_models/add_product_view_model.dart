import 'package:flutter/widgets.dart';
import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';

class AddProductViewModel extends EditProductViewModel {
  bool get _checkIfCanAddProduct => itemName != null && price != null && discountedPrice != null && quantity != null && stockQuantity != null;
  @override
  void onSubmit() {
    debugPrint("Hello Add");
    if (_checkIfCanAddProduct) {
      debugPrint("Hello inside Add");
      ProductRepository().addProduct(NewProductEntity(
          itemName: itemName!,
          price: price!,
          discountedPrice: discountedPrice!,
          quantity: quantity!,
          weightUnit: weightUnit,
          stockQuantity: stockQuantity!,
          stockWeightUnit: stockWeightUnit,
          imageFilePath: imageFilePath));
    } else {
      ProductIOUIService.showToast("Please fill out all fields");
    }
  }
}
