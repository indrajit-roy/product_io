import 'package:product_io/core/services/product/models/product_io_product.dart';
import 'package:product_io/core/services/product_io_services.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/domain/repositories/product_repository_i.dart';
import 'package:product_io/inventory/ui/view_models/edit_product_view_model.dart';

class ProductRepository implements ProductRepositoryInterface {
  final api = ProductIOServices.singleton.product;
  @override
  Future<ProductEntity> addProduct(NewProductEntity newProduct) async {
    try {
      final result = await api.addProduct(newProduct.newProductIO);
      return result.entity;
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<List<ProductEntity>> getProducts({String? category}) async {
    try {
      final result = await api.getProducts();
      return result.map((e) => e.entity).toList();
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<ProductEntity> getProduct({required String id}) async {
    try {
      final result = await api.getProduct(id: id);
      return result.entity;
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<ProductEntity> setProduct({required ProductEntity product, required ProductEntity oldProduct}) async {
    try {
      final result = await api.setProduct(product: product.productIO, oldProduct: oldProduct.productIO);
      return result.entity;
    } on Exception catch (e) {
      throw e;
    }
  }
}

extension on ProductEntity {
  ProductIOProduct get productIO => ProductIOProduct(
      id: id,
      itemName: itemName,
      price: price,
      discountedPrice: discountedPrice,
      quantity: quantity,
      weightUnit: weightUnit.name,
      stockQuantity: stockQuantity,
      stockWeightUnit: stockWeightUnit.name,
      imageFilePath: imageFilePath);
}

extension on NewProductEntity {
  ProductIONewProduct get newProductIO => ProductIONewProduct(
      itemName: itemName,
      price: price,
      discountedPrice: discountedPrice,
      quantity: quantity,
      weightUnit: weightUnit.name,
      stockQuantity: stockQuantity,
      stockWeightUnit: stockWeightUnit.name,
      imageFilePath: imageFilePath);
}

extension on ProductIOProduct {
  ProductEntity get entity {
    final weightUnitString = WeightUnit.values.asNameMap()[weightUnit];
    if (weightUnitString != null) {
      return ProductEntity(
          id: id,
          itemName: itemName,
          price: price,
          discountedPrice: discountedPrice,
          quantity: quantity,
          weightUnit: weightUnitString,
          stockQuantity: stockQuantity,
          stockWeightUnit: weightUnitString,
          imageFilePath: imageFilePath);
    } else {
      throw Exception("Weight unit does not match existing enums, value : $weightUnit");
    }
  }
}
