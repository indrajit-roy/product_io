import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';

class FetchProductUseCase {
  Future<ProductEntity> call({required String id}) async {
    try {
      return await ProductRepository().getProduct(id: id);
    } on Exception catch (e) {
      throw e;
    }
  }
}
