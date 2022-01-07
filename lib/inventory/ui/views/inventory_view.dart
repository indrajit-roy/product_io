import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_fields.dart';
import 'package:product_io/core/widgets/text_views.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/inventory_view_model.dart';
import 'package:product_io/inventory/ui/views/add_product_view.dart';
import 'package:product_io/inventory/ui/views/product_item_view.dart';
import 'package:product_io/inventory/ui/widgets/app_bars.dart';
import 'package:product_io/inventory/ui/widgets/inventory_text_fields.dart';
import 'package:product_io/main.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> with RouteAware {
  late InventoryViewModel vm;
  @override
  void initState() {
    vm = InventoryViewModel();
    vm.getProducts();
    super.initState();
  }

  @override
  void didPopNext() {
    vm.products.value.sort((a, b) => b.date.compareTo(a.date));
    vm.products.value = vm.products.value;
    super.didPopNext();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    vm.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InventoryAppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final didAdd = await navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => const AddProductView(),
          ));
          if (didAdd == true) vm.getProducts();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InventoryTextField(
                    hintText: "Search",
                    onChanged: (p0) {
                      vm.searchInput.value = p0.toLowerCase();
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final range = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.utc(2021),
                        lastDate: DateTime.now(),
                      );
                      if (range != null) {
                        vm.dateRange.value = range;
                      }
                    },
                    child: const Text("Select Date"))
              ],
            ),
            Expanded(
              child: StreamBuilder<List<ProductEntity>>(
                stream: vm.products,
                initialData: vm.products.valueOrNull,
                builder: (BuildContext context, AsyncSnapshot<List<ProductEntity>> snapshot) {
                  if (snapshot.data == null || snapshot.data?.isEmpty == true) {
                    return StreamBuilder<bool>(
                        initialData: vm.isFetching.value,
                        stream: vm.isFetching,
                        builder: (context, snapshot) {
                          if (snapshot.data == true) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return const Center(child: ProductIOText("No products in Inventory"));
                        });
                  }
                  return ListView.builder(
                    itemExtent: 130,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return Padding(
                        key: Key("ProductItemViewPadding#${product.id}"),
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                        child: ProductItemView(
                          key: Key("ProductItemView#${product.id}"),
                          id: product.id,
                          entity: product,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
