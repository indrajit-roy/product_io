import 'package:firebase_core/firebase_core.dart';

class AppInitCalls {
  Future<void> call() async {
    await Firebase.initializeApp();
  }
}
