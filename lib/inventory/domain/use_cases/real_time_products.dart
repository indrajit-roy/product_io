import 'package:product_io/inventory/domain/entities/product_entity.dart';
import 'package:rxdart/rxdart.dart';

class RealTimeProducts {
  RealTimeProducts._();
  static RealTimeProducts? _instance;
  factory RealTimeProducts() => _instance ??= RealTimeProducts._();

  final productUpdates = BehaviorSubject<ProductEntity>();
}
