import 'package:flutter/material.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/widgets/inventory_text_views.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity entity;
  const ProductDetails({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: Image(
              image: entity.image ?? const AssetImage("chooser_dummy.png"),
              fit: BoxFit.cover,
            )),
        InventoryTextView.n18(entity.itemName),
        InventoryTextView.n18(entity.price.toString()),
        InventoryTextView.n18(entity.weightUnit.name),
        InventoryTextView.n18(entity.category ?? ""),
        InventoryTextView.n18(entity.description ?? ""),
        InventoryTextView.n18(entity.stockQuantity.toString()),
        InventoryTextView.n18(entity.stockWeightUnit.name)
      ],
    );
  }
}

class ProductRecordItem extends StatelessWidget {
  final ProductEntity entity;

  const ProductRecordItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(border: Border.all(color: Colors.green[800] ?? Colors.green), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          InventoryTextView.n12(entity.itemName),
          InventoryTextView.n12(entity.price.toString()),
          InventoryTextView.n12(entity.weightUnit.name),
          InventoryTextView.n12(entity.category ?? ""),
          InventoryTextView.n12(entity.description ?? ""),
          InventoryTextView.n12(entity.stockQuantity.toString()),
          InventoryTextView.n12(entity.stockWeightUnit.name)
        ],
      ),
    );
  }
}
