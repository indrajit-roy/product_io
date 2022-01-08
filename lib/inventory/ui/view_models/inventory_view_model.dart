import 'dart:async';

import 'package:flutter/material.dart';
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
      _filterBySearch(value);
    });
    dateRange.listen((value) {
      debugPrint("dt dbg start :${value.start} end: ${value.end}");
      _filterByDate(value);
    });
  }

  void _filterByDate(DateTimeRange dateRange) => products.value = baseProducts
      .where((element) => element.date.isBefore(dateRange.end.add(const Duration(days: 1))) && element.date.isAfter(dateRange.start))
      .toList();

  void _filterBySearch(String value) => products.value = baseProducts
      .where((element) =>
          element.itemName.toLowerCase().startsWith(value) ||
          element.itemName.toLowerCase().contains(value) ||
          element.price.toString().toLowerCase().contains(value) ||
          element.discountedPrice.toString().toLowerCase().contains(value))
      .toList();

  Future<void> getProducts() async {
    try {
      if (!isFetching.isClosed) {
        isFetching.value = true;
      }
      final result = await ProductRepository().getProducts();
      if (!products.isClosed) products.value = baseProducts = result;
      if (!isFetching.isClosed) {
        isFetching.value = false;
      }
    } on Exception catch (e) {
      debugPrint("getProducts() exception $e");
    }
  }

  void dispose() {
    products.close();
  }
}
