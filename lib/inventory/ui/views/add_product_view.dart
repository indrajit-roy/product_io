import 'package:flutter/material.dart';
import 'package:product_io/inventory/ui/view_models/add_product_view_model.dart';
import 'package:product_io/inventory/ui/views/edit_product_view.dart';

class AddProductView extends EditProductView {
  const AddProductView({Key? key}) : super(key: key);

  @override
  AddProductViewModel createViewModel() => AddProductViewModel();
}
