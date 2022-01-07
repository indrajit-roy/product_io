import 'package:flutter/src/foundation/key.dart';
import 'package:product_io/core/widgets/text_views.dart';

class InventoryTextView extends ProductIOText {
  const InventoryTextView(String text, {Key? key}) : super(text, key: key);
  const InventoryTextView.n12(String text, {Key? key}) : super(text, key: key, style: const ProductIOTextStyle(fontSize: 12));
  const InventoryTextView.n18(String text, {Key? key}) : super(text, key: key, style: const ProductIOTextStyle(fontSize: 18));
}
