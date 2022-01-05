import 'package:product_io/core/services/auth/firebase_auth_service.dart';
import 'package:product_io/core/services/auth/models/product_io_user.dart';

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
