import 'package:flutter/widgets.dart';
import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';
import 'package:product_io/main.dart';

class AddProductViewModel extends EditProductViewModel {
  bool get _checkIfCanAddProduct => itemName != null && price != null && discountedPrice != null && quantity != null && stockQuantity != null;
  @override
  void onSubmit() async {
    debugPrint("Hello Add");
    if (_checkIfCanAddProduct) {
      debugPrint("Hello inside Add");
      isUpdating.value = true;
      await ProductRepository().addProduct(NewProductEntity(
          itemName: itemName!,
          price: price!,
          discountedPrice: discountedPrice!,
          category: category,
          description: description,
          quantity: quantity!,
          weightUnit: weightUnit,
          stockQuantity: stockQuantity!,
          stockWeightUnit: stockWeightUnit,
          imageFilePath: imageFilePath));
      isUpdating.value = false;
      navigatorKey.currentState?.pop(true);
    } else {
      ProductIOUIService.showToast("Please fill out all fields");
    }
  }
}
