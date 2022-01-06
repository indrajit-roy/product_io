import 'package:product_io/core/services/auth/firebase_auth_service.dart';
import 'package:product_io/core/services/auth/models/product_io_user.dart';
import 'package:product_io/core/services/product/models/product_io_product.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';

class ProductIOServices {
  ProductIOServices._();
  static ProductIOServices? _singleton;
  static ProductIOServices get singleton => _singleton ??= ProductIOServices._();

  final AuthServiceInterface auth = FirebaseAuthService();
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
Future<ProductIOProduct> addProduct(ProductIONewProduct newProduct);
  Future<List<ProductIOProduct>> getProducts({String category});
}
