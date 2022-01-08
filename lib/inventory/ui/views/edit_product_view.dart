import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/image_chooser.dart';
import 'package:product_io/core/widgets/text_views.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';
import 'package:product_io/inventory/ui/widgets/buttons.dart';
import 'package:product_io/inventory/ui/widgets/inventory_text_fields.dart';

class EditProductView extends StatefulWidget {
  final ProductEntity? entity;
  const EditProductView({Key? key, this.entity}) : super(key: key);

  EditProductViewModel createViewModel() => EditProductViewModel();
  @override
  _EditProductViewState createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  late EditProductViewModel vm;
  @override
  void initState() {
    debugPrint("Widget is ${widget.runtimeType}");
    vm = widget.createViewModel();
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
          child: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: [
            ImageChooser(
              initialImage: widget.entity?.image,
              height: MediaQuery.of(context).size.width,
              width: double.infinity,
              onImageChanged: (imageFile) => vm.imageFilePath = imageFile.path,
            ),
            InventoryTextField.neoScaffold(
              context: context,
              hintText: "Item Name",
              initailText: vm.itemName,
              onChanged: (p0) => vm.itemName = p0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InventoryTextField.neoScaffold(
                    context: context,
                    hintText: "Price",
                    initailText: vm.price?.toString(),
                    onChanged: (p0) => vm.price = double.tryParse(p0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InventoryTextField.neoScaffold(
                    context: context,
                    hintText: "Discounted Price",
                    initailText: vm.discountedPrice?.toString(),
                    onChanged: (p0) => vm.discountedPrice = double.tryParse(p0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InventoryTextField.neoScaffold(
                    context: context,
                    hintText: "Quantity",
                    initailText: vm.quantity?.toString(),
                    onChanged: (p0) => vm.quantity = double.tryParse(p0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton<WeightUnit>(
                    underline: const SizedBox(),
                    alignment: Alignment.bottomCenter,
                    hint: ProductIOText(vm.weightUnit.abbr),
                    items: [
                      ...WeightUnit.values
                          .map((e) => DropdownMenuItem<WeightUnit>(
                                child: ProductIOText(e.name),
                                value: e,
                              ))
                          .toList()
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        vm.weightUnit = value;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
            InventoryTextField.neoScaffold(
              context: context,
              hintText: "Category",
              initailText: vm.category,
              onChanged: (p0) => vm.category = p0,
            ),
            InventoryTextField.neoScaffold(
              context: context,
              hintText: "Description",
              initailText: vm.description,
              onChanged: (p0) => vm.description = p0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InventoryTextField.neoScaffold(
                    context: context,
                    hintText: "Total Stock",
                    initailText: vm.stockQuantity?.toString(),
                    onChanged: (p0) => vm.stockQuantity = double.tryParse(p0),
                  ),
                ),
                DropdownButton<WeightUnit>(
                  underline: const SizedBox(),
                  alignment: Alignment.bottomCenter,
                  hint: ProductIOText(vm.stockWeightUnit.abbr),
                  items: [
                    ...WeightUnit.values
                        .map((e) => DropdownMenuItem<WeightUnit>(
                              child: ProductIOText(e.name),
                              value: e,
                            ))
                        .toList()
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      vm.stockWeightUnit = value;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: StreamBuilder<bool>(
                  initialData: vm.isUpdating.value,
                  stream: vm.isUpdating,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return ElevatedButton(
                          onPressed: () {},
                          child: Center(
                              child: SizedBox(
                            height: 24,
                            width: 24,
                            child: StreamBuilder<double>(
                                initialData: vm.progress.value,
                                stream: vm.progress,
                                builder: (context, snapshot) {
                                  return CircularProgressIndicator(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    strokeWidth: 2,
                                    value: snapshot.data == 0 ? null : snapshot.data,
                                  );
                                }),
                          )));
                    }
                    return InventoryButton.editProduct(
                      onPressed: () => vm.onSubmit(),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
