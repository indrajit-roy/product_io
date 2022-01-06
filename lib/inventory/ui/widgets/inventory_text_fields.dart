import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_fields.dart';

class InventoryTextField extends ProductIOTextField {
  const InventoryTextField({Key? key}) : super(key: key);
  const InventoryTextField.itemName(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Item Name",
          ),
        );
  const InventoryTextField.price({Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Price",
          ),
        );
  const InventoryTextField.discountedPrice(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Discounted Price",
          ),
        );
  const InventoryTextField.quantity(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Quantity",
          ),
        );
  const InventoryTextField.category(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Category",
          ),
        );
  const InventoryTextField.description(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Description",
          ),
        );
  const InventoryTextField.stockQuantity(
      {Key? key, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: const InputDecoration(
            hintText: "Total Stock",
          ),
        );
}
