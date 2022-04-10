import 'package:walmart_app_design/model/product.dart';

class PurchasePosition {
  Product product;
  int quantity;
  PurchasePosition({
    required this.product,
    required this.quantity,
  });
}
