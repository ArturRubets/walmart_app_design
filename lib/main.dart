import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/app_state.dart';
import 'package:walmart_app_design/model/electronic_repository.dart';
import 'package:walmart_app_design/model/food_repository.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/model/purchase_position.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';
import "package:collection/collection.dart";

void main() {
  runApp(
    const AppStateWidget(
      child: MyApp(),
    ),
  );
}

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  static _AppStateWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppStateWidgetState>()!;

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  AppState _model = AppState(
    foodList: FoodRepository.loadFoods(),
    electronicList: ElectronicRepository.loadElectronic(),
  );

  void addToCart(Product product) {
    final List<Product> newItemsInCart = List.from(_model.itemsInCart);
    newItemsInCart.add(product);
    setState(() {
      _model = _model.copyWith(
        itemsInCart: newItemsInCart,
      );
    });
  }

  List<PurchasePosition> getPurchases() {
    List<PurchasePosition> items = [];

    final groupedItems = groupBy(_model.itemsInCart, (Product item) => item.id);

    groupedItems.forEach((key, value) {
      items.add(
        PurchasePosition(product: value.first, quantity: value.length),
      );
    });

    return items;
  }

  int itemsInCart() {
    return Set.from(_model.itemsInCart.map((item) => item.id)).length;
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _model,
      child: widget.child,
    );
  }
}

class AppStateScope extends InheritedWidget {
  final AppState data;
  const AppStateScope(
    this.data, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;

  @override
  bool updateShouldNotify(AppStateScope oldWidget) => data != oldWidget.data;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ConstantScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Walmart',
      theme: buildTheme(),
      home: const HomePage(),
      initialRoute: '/splash',
      onGenerateRoute: _getRoute,
    );
  }

  Route? _getRoute(RouteSettings settings) {
    if (settings.name != '/splash') {
      return null;
    }
    return MaterialPageRoute(
      builder: ((context) => const SplashPage(duration: Duration(seconds: 2))),
    );
  }
}
