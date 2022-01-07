import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_io/inventory/data/repositories/product_repository.dart';
import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:product_io/inventory/domain/use_cases/real_time_products.dart';
import 'package:rxdart/rxdart.dart';

class InventoryViewModel {
  InventoryViewModel() {
    init();
  }
  final products = BehaviorSubject<List<ProductEntity>>();
  final isFetching = BehaviorSubject.seeded(false);
  List<ProductEntity> baseProducts = [];
  StreamSubscription? subscription;

  final searchInput = BehaviorSubject.seeded("");
  final dateRange = BehaviorSubject.seeded(DateTimeRange(start: DateTime.utc(2020), end: DateTime.now()));

  Future<void> init() async {
    subscription = RealTimeProducts().productUpdates.listen((value) {
      final index = products.value.indexWhere((element) => element.id == value.id);
      if (index == -1) return;
      products.value[index] = value;
      products.value = products.value..sort((a, b) => b.date.compareTo(a.date));
    });
    searchInput.listen((value) {
      debugPrint("search input $value");
      if (value.isEmpty) {
        products.value = baseProducts;
        return;
      }
      products.value = baseProducts
          .where((element) =>
              element.itemName.toLowerCase().startsWith(value) ||
              element.itemName.toLowerCase().contains(value) ||
              element.price.toString().toLowerCase().contains(value) ||
              element.discountedPrice.toString().toLowerCase().contains(value))
          .toList();
    });
    dateRange.listen((value) {
      debugPrint("dt dbg start :${value.start} end: ${value.end}");
      products.value = baseProducts
          .where((element) => element.date.isBefore(value.end.add(const Duration(days: 1))) && element.date.isAfter(value.start))
          .toList();
    });
  }

  Future<void> getProducts() async {
    try {
      isFetching.value = true;
      final result = await ProductRepository().getProducts();
      isFetching.value = false;
      if (!products.isClosed) products.value = baseProducts = result;
    } on Exception catch (e) {
      // TODO
    }
  }

  void dispose() {
    products.close();
  }
}
