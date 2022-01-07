import 'package:flutter/src/foundation/key.dart';
import 'package:product_io/core/widgets/buttons.dart';
import 'package:product_io/core/widgets/text_views.dart';

class InventoryButton extends ProductIOButton {
  const InventoryButton.addProduct({Key? key})
      : super(key: key, child: const ProductIOText("Add Product"));
  const InventoryButton.editProduct({Key? key,void Function()? onPressed})
      : super(key: key, child: const ProductIOText("Save"),onPressed: onPressed);
}
