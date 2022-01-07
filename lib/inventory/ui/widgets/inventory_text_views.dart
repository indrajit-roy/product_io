import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_views.dart';

class InventoryTextView extends ProductIOText {
  const InventoryTextView(String text, {Key? key}) : super(text, key: key);
  const InventoryTextView.n12(String text, {Key? key}) : super(text, key: key, style: const ProductIOTextStyle(fontSize: 12));
  const InventoryTextView.n10(String text, {Key? key}) : super(text, key: key, style: const ProductIOTextStyle(fontSize: 10.5, color: Colors.grey));
  const InventoryTextView.n14bold(String text, {Key? key})
      : super(text, key: key, style: const ProductIOTextStyle(fontSize: 14, fontWeight: FontWeight.w600));
  const InventoryTextView.n12bold(String text, {Key? key})
      : super(text, key: key, style: const ProductIOTextStyle(fontSize: 12, fontWeight: FontWeight.w600));
  const InventoryTextView.n18(String text, {Key? key})
      : super(text, key: key, style: const ProductIOTextStyle(fontSize: 18, fontWeight: FontWeight.w600));
}
