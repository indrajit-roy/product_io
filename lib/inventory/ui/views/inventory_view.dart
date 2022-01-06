import 'package:flutter/material.dart';
import 'package:product_io/inventory/ui/views/add_product_view.dart';
import 'package:product_io/inventory/ui/views/edit_product_view.dart';
import 'package:product_io/inventory/ui/widgets/app_bars.dart';
import 'package:product_io/main.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InventoryAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (context) => const EditProductView(),
        )),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Text("INVENTORY"),
          ],
        ),
      ),
    );
  }
}
