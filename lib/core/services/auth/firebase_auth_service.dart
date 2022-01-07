import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/core/services/auth/models/product_io_user.dart';
import 'package:product_io/core/services/product_io_services.dart';

class FirebaseAuthService implements AuthServiceInterface {
  User? _user;
  @override
  ProductIOUser? get currentUser => FirebaseAuth.instance.currentUser?.productIOUser ?? _user?.productIOUser;

  @override
  Stream<AuthState<dynamic>> get authState => FirebaseAuth.instance.authStateChanges().map((event) {
        debugPrint("Fire auth $event");
        if (event != null) {
          return AuthState.authorized(userData: _user = event);
        } else {
          return const AuthState.unAuthorized();
        }
      });

  Future<dynamic> signInWithEmailIdAndPassword(String email, String password) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return result;
    } on Exception catch (e) {
      throw e;
    }
  }
}

extension on User {
  ProductIOUser get productIOUser => ProductIOUser(id: uid, name: displayName ?? "");
}
