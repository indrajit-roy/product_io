import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_io/core/services/product/models/product_io_product.dart';
import 'package:product_io/core/services/product_io_services.dart';

class ProductServiceFirebase implements ProductServiceInterface {
  final service = FirebaseFirestore.instance;

  @override
  Future<ProductIOProduct> addProduct(ProductIONewProduct newProduct) async {
    try {
      final result = await service.collection("products").add(newProduct.toMap());
      final doc = await result.get();
      if (doc.data() != null) {
        return ProductIOProduct.fromNewProduct(result.id, newProduct: ProductIONewProduct.fromMap(doc.data()!));
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<List<ProductIOProduct>> getProducts({String? category}) async {
    try {
      final result = await service.collection("products").get();
      return result.docs.map((e) {
        return ProductIOProduct.fromNewProduct(e.id, newProduct: ProductIONewProduct.fromMap(e.data()));
      }).toList();
    } on Exception catch (e) {
      throw e;
    }
  }
}
