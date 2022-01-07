import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/core/common/product_io_ui_service.dart';
import 'package:product_io/inventory/data/repositories/image_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/domain/use_cases/fetch_product_usecase.dart';
import 'package:product_io/inventory/domain/use_cases/real_time_products.dart';
import 'package:product_io/inventory/ui/views/product_records_view.dart';
import 'package:product_io/inventory/ui/views/update_product_view.dart';
import 'package:product_io/main.dart';
import 'package:rxdart/rxdart.dart';

class ProductItemViewModel {
  final String id;
  ProductEntity? entity;
  final isFetching = BehaviorSubject.seeded(false);
  final isFetchingImage = BehaviorSubject.seeded(false);

  final BehaviorSubject<ImageProvider> image = BehaviorSubject.seeded(const AssetImage("chooser_dummy.png"));

  ProductItemViewModel({required this.id, this.entity}) {
    init();
  }

  final FetchProductUseCase fetchProduct = FetchProductUseCase();

  Future<void> init() async {
    try {
      if (entity == null) {
        if (!isFetching.isClosed) {
          isFetching.value = true;
        }
        entity ??= await fetchProduct(id: id);
        if (!isFetching.isClosed) {
          isFetching.value = false;
        }
      }
    } on Exception catch (e) {
      debugPrint("Exception in fetching product $id, $e");
      ProductIOUIService.showToast("Something went wrong");
    } finally {
      if (isFetching.value == true) isFetching.value = false;
      _fetchImage();
    }
  }

  Future<void> onItemTap() async {
    if (entity != null) {
      navigatorKey.currentState?.push<ProductEntity>(MaterialPageRoute(
        builder: (context) => ProductRecordsView(id: id, currentEntity: entity!),
      ));
    }
  }

  Future<void> onTap() async {
    if (entity != null) {
      final updatedEntity = await navigatorKey.currentState?.push<ProductEntity>(MaterialPageRoute(
        builder: (context) => UpdateProductView(entity: entity!),
      ));
      if (updatedEntity == null) return;
      isFetching.value = true;
      entity = updatedEntity;
      RealTimeProducts().productUpdates.value = updatedEntity;
      isFetching.value = false;
      _fetchImage();
    }
  }

  Future<void> onTap2() async {}

  void _fetchImage() async {
    final refPath = entity?.imageFilePath;
    if (refPath == null) return;
    try {
      final image = await ImageRepositoryFirebase().getImage<MemoryImage>(refPath);
      entity = entity?.copyWith(image: image);
      this.image.value = image;
    } on Exception catch (e) {
      debugPrint("Failed To fetch image $e");
    }
  }

  void dispose() {
    isFetching.close();
    isFetchingImage.close();
  }
}
