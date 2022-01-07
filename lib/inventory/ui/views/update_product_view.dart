import 'package:flutter/widgets.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';
import 'package:product_io/inventory/ui/views/edit_product_view.dart';

class UpdateProductView extends EditProductView {
  const UpdateProductView({Key? key, required ProductEntity entity}) : super(key: key, entity: entity);
  @override
  UpdateProductViewModel createViewModel() {
    if (entity != null) return UpdateProductViewModel(entity: entity!);
    throw AssertionError("Entity in Updating Product is Null");
  }
}
