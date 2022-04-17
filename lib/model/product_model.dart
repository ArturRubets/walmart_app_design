import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/electronic_repository.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/food_repository.dart';
import 'package:walmart_app_design/model/product.dart';
import "package:collection/collection.dart";

class ProductModel extends ChangeNotifier {
  final List<Food> _food = FoodRepository.load();
  final List<Electronic> _electronic = ElectronicRepository.load();
  final Map<Product, int> _itemsInCart = {};

  UnmodifiableListView<Food> get food => UnmodifiableListView(_food);
  UnmodifiableListView<Electronic> get electronic =>
      UnmodifiableListView(_electronic);
  UnmodifiableMapView<Product, int> get itemsInCart =>
      UnmodifiableMapView(_itemsInCart);

  void addToCart(Product product) {
    int? quantity = _itemsInCart[product] ?? 0;
    quantity += 1;
    _itemsInCart.addAll({product: quantity});

    notifyListeners();
  }

  void removeFromCart(Product product, int count, BuildContext context) {
    int? key = _itemsInCart[product];
    var quantity = key ?? 0;
    if (quantity - count > 0) {
      _itemsInCart[product] = quantity - count;
    } else {
      // if there are no products then delete
      _itemsInCart.remove(product);
    }
    closeScreenIfEmptyCart(context);
    notifyListeners();
  }

  void closeScreenIfEmptyCart(BuildContext context) {
    if (_itemsInCart.isEmpty) {
      Navigator.of(context).pop();
    }
  }

  void clearItemsInCart() {
    _itemsInCart.clear();
    notifyListeners();
  }

  int quantityItemsInCart() => _itemsInCart.values.sum;

  int quantityProductsInCart() => _itemsInCart.length;

  double calculateSubtotal() {
    double subtotal = 0;
    _itemsInCart.forEach((key, value) {
      subtotal += key.price * value;
    });
    return subtotal;
  }

  double calcTaxes() => calculateSubtotal() * taxesPercent;

  double calcTotal() => calculateSubtotal() + calcTaxes();
}
