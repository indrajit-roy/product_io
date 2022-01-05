import '../entities/product_io_user_entity.dart';

abstract class SignUpRepositoryInterface {
  Future<ProductIOUserEntity> signUpWithEmailAndPassword({required String email, required String password});
}
