import 'package:product_io/inventory/domain/entities/product_entity.dart';

abstract class ProductRepositoryInterface {
  Future<ProductEntity> addProduct(NewProductEntity newProduct);
  Future<List<ProductEntity>> getProducts({String category});
  Future<ProductEntity> getProduct({required String id});
  Future<ProductEntity> setProduct({required ProductEntity product, required ProductEntity oldProduct});
  Future<List<ProductEntity>> getProductRecords({required String id});
}
