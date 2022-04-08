import 'package:walmart_app_design/model/product.dart';

class Food implements Product {
  @override
  final int id;
  @override
  final String assetPath;
  @override
  final String productName;
  @override
  final double price;

  final String note;
  final double? pricePerWeight;
  final bool isStock;
  final String location;

  const Food({
    required this.id,
    required this.assetPath,
    required this.productName,
    required this.price,
    required this.note,
    this.pricePerWeight,
    required this.isStock,
    required this.location,
  });
}
