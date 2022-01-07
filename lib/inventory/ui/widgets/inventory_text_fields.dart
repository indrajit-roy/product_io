import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_fields.dart';

class InventoryTextField extends ProductIOTextField {
  InventoryTextField({Key? key, String? hintText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          inputDecoration: InputDecoration(
            hintText: hintText ?? "",
          ),
        );
        
  const InventoryTextField.itemName({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Item Name",
          ),
        );
  const InventoryTextField.price({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Price",
          ),
        );
  const InventoryTextField.discountedPrice({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Discounted Price",
          ),
        );
  const InventoryTextField.quantity({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Quantity",
          ),
        );
  const InventoryTextField.category({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Category",
          ),
        );
  const InventoryTextField.description({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Description",
          ),
        );
  const InventoryTextField.stockQuantity({Key? key, String? initailText, void Function(String)? onChanged})
      : super(
          key: key,
          onChanged: onChanged,
          initialText: initailText,
          inputDecoration: const InputDecoration(
            hintText: "Total Stock",
          ),
        );
}
