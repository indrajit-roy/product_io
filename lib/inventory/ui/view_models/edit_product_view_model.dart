enum WeightUnit { kilograms, pounds, grams, ounces }

class EditProductViewModel {
  String? itemName;
  double? price;
  double? discountedPrice;
  double? quantity;
  WeightUnit? weightUnit;
  String? category;
  String? description;
  double? stockQuantity;
  WeightUnit? stockWeightUnit;

  Future<void> init() async {}
  void dispose() {}
}
