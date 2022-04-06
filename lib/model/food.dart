import 'package:walmart_app_design/model/product.dart';

class Food implements Product {
  @override
  final String assetPath;
  @override
  final String productName;
  final String note;
  final double? pricePerWeight;
  final double price;
  final bool isStock;
  final String location;

  const Food({
    required this.assetPath,
    required this.productName,
    required this.note,
    this.pricePerWeight,
    required this.price,
    required this.isStock,
    required this.location,
  });
}
