import 'package:product_io/core/services/auth/firebase_auth_service.dart';
import 'package:product_io/core/services/auth/models/product_io_user.dart';
import 'package:product_io/core/services/product/models/product_io_product.dart';
import 'package:product_io/core/services/product/product_service.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';

class ProductIOServices {
  ProductIOServices._();
  static ProductIOServices? _singleton;
  static ProductIOServices get singleton => _singleton ??= ProductIOServices._();

  final AuthServiceInterface auth = FirebaseAuthService();
  final ProductServiceInterface product = ProductServiceFirebase();
}

class AuthState<T> {
  final bool isAuthenticated;
  final T? userData;
  const AuthState.unAuthorized()
      : userData = null,
        isAuthenticated = false;
  const AuthState.authorized({this.userData}) : isAuthenticated = true;
}

abstract class AuthServiceInterface {
  ProductIOUser? get currentUser;
  Stream<AuthState> get authState;
}

abstract class ProductServiceInterface {
  Future<ProductIOProduct> addProduct(ProductIONewProduct newProduct, {void Function(double progress)? onProgress});
  Future<List<ProductIOProduct>> getProducts({String category});
  Future<ProductIOProduct> getProduct({required String id});
  Future<ProductIOProduct> setProduct(
      {required ProductIOProduct product, required ProductIOProduct oldProduct, void Function(double progress)? onProgress});
  Future<List<ProductIOProduct>> getProductRecords(String productId);
}
