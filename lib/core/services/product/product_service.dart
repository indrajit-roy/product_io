import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/core/services/product/models/product_io_product.dart';
import 'package:product_io/core/services/product_io_services.dart';

class ProductServiceFirebase implements ProductServiceInterface {
  final service = FirebaseFirestore.instance;

  @override
  Future<ProductIOProduct> addProduct(ProductIONewProduct newProduct) async {
    try {
      final result = await service.collection("products").add(newProduct.toMap());
      String? refPath;
      if (newProduct.imageFilePath != null) {
        refPath = await _uploadToStorage(result.id, newProduct);
      }
      final doc = await result.get();
      if (doc.data() != null) {
        ProductIOProduct product = ProductIOProduct.fromNewProduct(result.id, newProduct: ProductIONewProduct.fromMap(doc.data()!));
        if (refPath != null) {
          await service.doc("${doc.reference.path}").set((product = product.copyWith(imageFilePath: refPath)).toMap());
        }
        return product;
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<String?> _uploadToStorage(String fileName, ProductIONewProduct product) async {
    Completer<String?> completer = Completer<String?>();
    final task = FirebaseStorage.instance.ref("products").child("$fileName.jpg").putFile(File(product.imageFilePath!));
    task.snapshotEvents.listen((event) {
      debugPrint("uploading to firebase ${event.bytesTransferred}");
      if (event.bytesTransferred == event.totalBytes)if(!completer.isCompleted) completer.complete(event.ref.fullPath);
    }, onError: (e, err) {
      debugPrint("uploading to firebase error $e, $err");
      completer.complete(null);
    });
    final refPath = await completer.future;
    debugPrint("up ref path : $refPath");
    return refPath;
  }

  @override
  Future<List<ProductIOProduct>> getProducts({String? category}) async {
    try {
      final result = await service.collection("products").get();
      return result.docs.map((e) {
        return ProductIOProduct.fromNewProduct(e.id, newProduct: ProductIONewProduct.fromMap(e.data()));
      }).toList();
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<ProductIOProduct> getProduct({required String id}) async {
    try {
      final result = await service.collection("products").doc(id).get();
      if (result.data() != null) {
        return ProductIOProduct.fromNewProduct(id, newProduct: ProductIONewProduct.fromMap(result.data()!));
      } else {
        throw Exception("Doc is null");
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<ProductIOProduct> setProduct({required ProductIOProduct product, required ProductIOProduct oldProduct}) async {
    try {
      ProductIOProduct updatedProduct = product;
      if (oldProduct.imageFilePath != updatedProduct.imageFilePath) {
        try {
          updatedProduct.imageFilePath = await _uploadToStorage(updatedProduct.id, product);
        } on Exception catch (e) {
          updatedProduct.imageFilePath = oldProduct.imageFilePath;
        }
      }
      await service.collection("products").doc(updatedProduct.id).update(updatedProduct.toMap());
      final result = await service.collection("products").doc(updatedProduct.id).get();
      if (result.data() != null) {
        return ProductIOProduct.fromNewProduct(updatedProduct.id, newProduct: ProductIONewProduct.fromMap(result.data()!));
      } else {
        throw Exception("Doc is null");
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
