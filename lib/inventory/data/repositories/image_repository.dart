import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class ImageRepositoryFirebase {
  Future<ImageProvider> getImage<T>(String referencePath) async {
    try {
      final uint8List = await FirebaseStorage.instance.ref(referencePath).getData();
      if (uint8List != null) {
        return MemoryImage(uint8List);
      } else {
        throw Exception("$T format not supported $uint8List");
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
