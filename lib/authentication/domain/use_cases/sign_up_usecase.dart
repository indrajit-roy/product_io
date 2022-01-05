import '../../data/repositories/sign_up_repository.dart';
import '../entities/product_io_user_entity.dart';

class SignUpUseCase {
  Future<ProductIOUserEntity> call({required String email, required String password}) async {
    try {
      return SignUpRepositoryFirebase().signUpWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }
}
