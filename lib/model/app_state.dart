import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/payment.dart';
import 'package:walmart_app_design/model/product.dart';

class AppState {
  const AppState({
    required this.foodList,
    required this.electronicList,
    required this.paymentList,
    this.itemsInCart = const {},
  });

  final List<Food> foodList;
  final List<Electronic> electronicList;
  final Map<Product, int> itemsInCart;
  final List<Payment> paymentList;

  AppState copyWith({
    List<Food>? foodList,
    List<Electronic>? electronicList,
    List<Payment>? paymentList,
    Map<Product, int>? itemsInCart,
  }) {
    return AppState(
      foodList: foodList ?? this.foodList,
      electronicList: electronicList ?? this.electronicList,
      paymentList: paymentList ?? this.paymentList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}
