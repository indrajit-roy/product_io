import 'package:product_io/authentication/data/repositories/sign_in_repository.dart';

import '../entities/product_io_user_entity.dart';

class SignInUseCase {
  Future<ProductIOUserEntity> call({required String email, required String password}) async {
    try {
      return SignInRepository().signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }
}
