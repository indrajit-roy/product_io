import 'package:flutter/material.dart';
import 'package:product_io/core/widgets/text_views.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/ui/view_models/product_records_view_model.dart';
import 'package:product_io/inventory/ui/widgets/product_widgets.dart';

class ProductRecordsView extends StatefulWidget {
  final String id;
  final ProductEntity currentEntity;
  const ProductRecordsView({Key? key, required this.id, required this.currentEntity}) : super(key: key);

  @override
  _ProductRecordsViewState createState() => _ProductRecordsViewState();
}

class _ProductRecordsViewState extends State<ProductRecordsView> {
  late ProductRecordsViewModel vm;
  @override
  void initState() {
    vm = ProductRecordsViewModel(id: widget.id, entity: widget.currentEntity);
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
      body: SafeArea(
        child: StreamBuilder(
          stream: vm.isFetching,
          initialData: vm.isFetching.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView(
              children: [
                ProductDetails(
                  entity: vm.entity,
                ),
                const ProductIOText(
                  " Past Records",
                  style: ProductIOTextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                StreamBuilder<Object>(
                    initialData: vm.productRecords.value,
                    stream: vm.productRecords,
                    builder: (context, snapshot) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vm.productRecords.value.length,
                        itemBuilder: (context, index) {
                          return ProductRecordItem(entity: vm.productRecords.value[index]);
                        },
                      );
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
