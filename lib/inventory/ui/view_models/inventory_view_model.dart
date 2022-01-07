import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:rxdart/rxdart.dart';

class InventoryViewModel {
  final products = BehaviorSubject<List<ProductEntity>>();

  Future<void> getProducts() async {
    try {
      final result = await ProductRepository().getProducts();
      if (!products.isClosed) products.value = result;
    } on Exception catch (e) {
      // TODO
    }
  }

  void dispose() {
    products.close();
  }
}
