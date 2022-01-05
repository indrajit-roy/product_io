import 'package:firebase_auth/firebase_auth.dart';
import 'package:product_io/authentication/domain/entities/product_io_user_entity.dart';
import 'package:product_io/authentication/domain/repositories/sign_in_repository_i.dart';

class SignInRepository implements SignInRepositoryInterface {
  final service = FirebaseAuth.instance;

  @override
  Future<ProductIOUserEntity> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await service.signInWithEmailAndPassword(email: email, password: password);
      if (result.user?.uid == null && result.user?.displayName == null) throw Exception();
      return ProductIOUserEntity(id: result.user!.uid, name: result.user!.displayName ?? "");
    } on Exception catch (e) {
      throw e;
    }
  }
}
