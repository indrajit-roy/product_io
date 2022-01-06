import 'package:product_io/inventory/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<ProductEntity> addProduct(NewProductEntity newProduct);
  Future<List<ProductEntity>> getProducts({String category});
}
