import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/product.dart';

class AppState {
  const AppState({
    required this.foodList,
    required this.electronicList,
    this.itemsInCart = const [],
  });

  final List<Food> foodList;
  final List<Electronic> electronicList;
  final List<Product> itemsInCart;

  AppState copyWith({
    List<Food>? foodList,
    List<Electronic>? electronicList,
    List<Product>? itemsInCart,
  }) {
    return AppState(
      foodList: foodList ?? this.foodList,
      electronicList: electronicList ?? this.electronicList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}
