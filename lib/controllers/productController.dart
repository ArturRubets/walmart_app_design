import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/electronic_repository.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/food_repository.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:collection/collection.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  final _food = FoodRepository.load();
  final _electronic = ElectronicRepository.load();
  final _itemsInCart = <Product, int>{}.obs;

  UnmodifiableListView<Food> get food => UnmodifiableListView(_food);
  UnmodifiableListView<Electronic> get electronic =>
      UnmodifiableListView(_electronic);
  UnmodifiableMapView<Product, int> get itemsInCart =>
      UnmodifiableMapView(_itemsInCart);

  void addToCart(Product product) {
    int? quantity = _itemsInCart[product] ?? 0;
    quantity += 1;
    _itemsInCart.addAll({product: quantity});
    update();
  }

  void removeFromCart(Product product, int count) {
    int? key = _itemsInCart[product];
    var quantity = key ?? 0;
    if (quantity - count > 0) {
      _itemsInCart[product] = quantity - count;
    } else {
      // if there are no products then delete
      _itemsInCart.remove(product);
    }
    closeScreenIfEmptyCart();
  }

  void closeScreenIfEmptyCart() {
    if (_itemsInCart.isEmpty) {
      Get.back();
    }
  }

  void clearItemsInCart() {
    _itemsInCart.clear();
  }

  RxInt quantityItemsInCart() => _itemsInCart.values.sum.obs;

  RxInt quantityItemsInCartByProduct(Product product) =>
      (_itemsInCart[product] ?? 0).obs;

  RxInt quantityProductsInCart() => _itemsInCart.length.obs;

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
