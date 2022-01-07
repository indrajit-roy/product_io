import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:rxdart/rxdart.dart';

class ProductRecordsViewModel {
  final String id;
  ProductEntity entity;
  final BehaviorSubject<List<ProductEntity>> productRecords = BehaviorSubject<List<ProductEntity>>.seeded(<ProductEntity>[]);
  final isFetching = BehaviorSubject.seeded(false);
  ProductRecordsViewModel({required this.id, required this.entity}) {
    init();
  }
  Future<void> init() async {
    isFetching.value = true;
    productRecords.value = await ProductRepository().getProductRecords(id: id);
    isFetching.value = false;
  }

  void dispose() {
    isFetching.close();
    productRecords.close();
  }
}
