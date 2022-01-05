import '../entities/product_io_user_entity.dart';

abstract class SignInRepositoryInterface {
  Future<ProductIOUserEntity> signInWithEmailAndPassword({required String email, required String password});
}
