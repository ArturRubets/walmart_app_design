import 'package:walmart_app_design/model/product.dart';

class Electronic implements Product {
  @override
  final String assetPath;
  @override
  final String productName;
  final String brand;
  final double pricePerMonth;
  final double fullPrice;
  final double quantityStars;
  final int rating;
  const Electronic({
    required this.assetPath,
    required this.productName,
    required this.brand,
    required this.pricePerMonth,
    required this.fullPrice,
    required this.quantityStars,
    required this.rating,
  }) : assert(quantityStars >= 0 && quantityStars <= 5);
}
