import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/product_io_user_entity.dart';
import '../../domain/repositories/sign_up_repository_i.dart';

class SignUpRepositoryFirebase implements SignUpRepositoryInterface {
  final service = FirebaseAuth.instance;
  @override
  Future<ProductIOUserEntity> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      final result = await service.createUserWithEmailAndPassword(email: email, password: password);
      if (result.user?.uid == null && result.user?.displayName == null) throw Exception();
      return ProductIOUserEntity(id: result.user!.uid, name: result.user!.displayName ?? "");
    } on Exception catch (e) {
      throw e;
    }
  }
}
