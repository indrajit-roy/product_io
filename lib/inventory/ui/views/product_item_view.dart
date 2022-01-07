import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
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
          onTap: vm.onTap,
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
                    children: [
                      //* Name
                      InventoryTextView.n18(vm.entity?.itemName ?? ""),
                      //* Price
                      InventoryTextView.n12("Rs ${vm.entity?.price ?? ""} per ${vm.entity?.quantity ?? ""} ${vm.entity?.weightUnit.name ?? ""}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const InventoryTextView.n12("Total Stock"),
                  //* Total Stock
                  InventoryTextView.n18("${vm.entity?.stockQuantity ?? ""}"),
                  //* Last Edited Date
                  const InventoryTextView.n12("Last Date"),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
