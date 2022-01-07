import 'package:flutter/material.dart';
import 'package:product_io/core/common/extensions/primitive_extensions.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';
import 'package:product_io/inventory/ui/view_models/product_item_view_model.dart';
import 'package:product_io/inventory/ui/widgets/inventory_text_views.dart';

class ProductItemView extends StatefulWidget {
  final String id;
  final ProductEntity? entity;
  const ProductItemView({Key? key, required this.id, this.entity}) : super(key: key);

  @override
  State<ProductItemView> createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  late ProductItemViewModel vm;
  @override
  void initState() {
    vm = ProductItemViewModel(id: widget.id, entity: widget.entity);
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: vm.isFetching.value,
      stream: vm.isFetching,
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: vm.onItemTap,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: StreamBuilder(
                  stream: vm.image,
                  initialData: vm.image.value,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Image(
                      image: snapshot.data,
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(12),
                        child: child,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //* Name
                      InventoryTextView.n18(vm.entity?.itemName ?? ""),
                      //* Price
                      InventoryTextView.n12bold("Rs ${vm.entity?.price ?? ""} per ${vm.entity?.quantity ?? ""} ${vm.entity?.weightUnit.abbr ?? ""}"),
                      const SizedBox(height: 8),
                      //* Total Stock
                      InventoryTextView.n12("Total Stock : ${vm.entity?.stockQuantity ?? ""} ${vm.entity?.stockWeightUnit.abbr ?? ""}"),
                      //* Last Edited Date
                      InventoryTextView.n10("Last : ${vm.entity?.date.timeAgoText} ago"),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: vm.onTap,
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.bottomRight,
                          elevation: 0,
                          minimumSize: const Size(36, 36),
                          maximumSize: const Size(36, 36),
                          primary: Theme.of(context).scaffoldBackgroundColor),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: vm.onTap,
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(36, 36),
                          primary: Theme.of(context).scaffoldBackgroundColor,
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(0)),
                      child: const Text(
                        "Update \n Stock",
                        style: TextStyle(fontSize: 10.5, color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
