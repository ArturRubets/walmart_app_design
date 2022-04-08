import 'package:walmart_app_design/model/product.dart';

class Electronic implements Product {
  @override
  final int id;
  @override
  final String assetPath;
  @override
  final String productName;
  @override
  final double price;

  final String brand;
  final double pricePerMonth;
  final double quantityStars;
  final int rating;
  const Electronic({
    required this.id,
    required this.price,
    required this.assetPath,
    required this.productName,
    required this.brand,
    required this.pricePerMonth,
    required this.quantityStars,
    required this.rating,
  }) : assert(quantityStars >= 0 && quantityStars <= 5);
}
