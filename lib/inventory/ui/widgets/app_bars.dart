import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_views.dart';

class InventoryAppBar extends AppBar {
  InventoryAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.green,
          shadowColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "product_io_logo.png",
            ),
          ),
          title: const ProductIOText(
            "Inventory",
            style: ProductIOTextStyle(color: Colors.white, fontSize: 24),
          ),
        );
}
