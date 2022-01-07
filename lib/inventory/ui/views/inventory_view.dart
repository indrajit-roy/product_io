import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_views.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/inventory_view_model.dart';
import 'package:product_io/inventory/ui/views/add_product_view.dart';
import 'package:product_io/inventory/ui/views/product_item_view.dart';
import 'package:product_io/inventory/ui/widgets/app_bars.dart';
import 'package:product_io/main.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  late InventoryViewModel vm;
  @override
  void initState() {
    vm = InventoryViewModel();
    vm.getProducts();
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InventoryAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (context) => const AddProductView(),
        )),
      ),
      body: SafeArea(
        child: StreamBuilder<List<ProductEntity>>(
          stream: vm.products,
          initialData: vm.products.valueOrNull,
          builder: (BuildContext context, AsyncSnapshot<List<ProductEntity>> snapshot) {
            if (snapshot.data == null || snapshot.data?.isEmpty == true) {
              return const Center(child: ProductIOText("No products in Inventory"));
            }
            return ListView.builder(
              itemExtent: 100,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductItemView(id: product.id);
              },
            );
          },
        ),
      ),
    );
  }
}
