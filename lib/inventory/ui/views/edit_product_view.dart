import 'package:flutter/material.dart';
import 'package:product_io/inventory/ui/view_models/add_product_view_model.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';
import 'package:product_io/inventory/ui/widgets/buttons.dart';
import 'package:product_io/inventory/ui/widgets/inventory_text_fields.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  _EditProductViewState createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  late EditProductViewModel vm;
  @override
  void initState() {
    vm = widget is EditProductView ? EditProductViewModel() : AddProductViewModel();
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          InventoryTextField.itemName(
            onChanged: (p0) => vm.itemName = p0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InventoryTextField.price(
                  onChanged: (p0) => vm.price = double.tryParse(p0),
                ),
              ),
              Expanded(
                flex: 1,
                child: InventoryTextField.discountedPrice(
                  onChanged: (p0) => vm.discountedPrice = double.tryParse(p0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InventoryTextField.quantity(
                  onChanged: (p0) => vm.quantity = double.tryParse(p0),
                ),
              ),
              Expanded(
                flex: 1,
                child: InventoryTextField.quantity(
                  onChanged: (p0) => vm.discountedPrice = double.tryParse(p0),
                ),
              ),
            ],
          ),
          InventoryTextField.category(
            onChanged: (p0) => vm.category = p0,
          ),
          InventoryTextField.description(
            onChanged: (p0) => vm.description = p0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InventoryTextField.quantity(
                  onChanged: (p0) => vm.stockQuantity = double.tryParse(p0),
                ),
              ),
              Expanded(
                flex: 1,
                child: InventoryTextField.quantity(
                  onChanged: (p0) => vm.discountedPrice = double.tryParse(p0),
                ),
              ),
            ],
          ),
          const InventoryButton.editProduct()
        ],
      )),
    );
  }
}
