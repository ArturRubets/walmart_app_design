import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/app_state.dart';
import 'package:walmart_app_design/model/electronic_repository.dart';
import 'package:walmart_app_design/model/food_repository.dart';
import 'package:walmart_app_design/model/payment_repository.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/screens/cart/cart.dart';
import 'package:walmart_app_design/screens/home/components/my_badge.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/loyalty_program/loyalty_program.dart';
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
  const AppStateWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  static _AppStateWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppStateWidgetState>()!;

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  AppState _model = AppState(
    foodList: FoodRepository.loadFoods(),
    electronicList: ElectronicRepository.loadElectronic(),
    paymentList: PaymentRepository.loadPayment(),
  );

  void addToCart(Product product) {
    final Map<Product, int> newItemsInCart = Map.from(_model.itemsInCart);
    var quantity = newItemsInCart[product] ?? 0;
    newItemsInCart[product] = quantity + 1;

    setState(() {
      _model = _model.copyWith(
        itemsInCart: newItemsInCart,
      );
    });
  }

  void removeFromCart(Product product, BuildContext context) {
    final Map<Product, int> newItemsInCart = Map.from(_model.itemsInCart);
    var quantity = newItemsInCart[product] ?? 0;
    if (quantity - 1 > 0) {
      newItemsInCart[product] = quantity - 1;
    } else {
      // none products
      newItemsInCart.remove(product);
    }

    setState(() {
      _model = _model.copyWith(
        itemsInCart: newItemsInCart,
      );
    });

    if (newItemsInCart.isEmpty) {
      Navigator.pop(context);
    }
  }

  int quantityItemsInCart() => _model.itemsInCart.values.sum;

  int quantityProductsInCart() => _model.itemsInCart.length;

  double calculateSubtotal() {
    double subtotal = 0;
    _model.itemsInCart.forEach((key, value) {
      subtotal += key.price * value;
    });

    return subtotal;
  }

  double calcTaxes() => calculateSubtotal() * taxesPercent;

  double calcTotal() => calculateSubtotal() + calcTaxes();

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

Row buildAppBar(BuildContext context) {
  final productsInCart = AppStateWidget.of(context).quantityProductsInCart();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          children: [
            Image.asset(
              'assets/icons/avatar.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Hi, John',
                style: Theme.of(context).textTheme.headline3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      Flexible(
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          semanticsLabel: 'Walmart logo',
          width: 36,
          height: 36,
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\$499.60',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: kWhite.withOpacity(0.8)),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                if (productsInCart > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const Cart()),
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(20),
              child: MyBadge(
                top: -6,
                right: -6,
                color: const Color(0xFFFCB619),
                itemsInCart: productsInCart,
                child: Image.asset(
                  'assets/icons/shopping-cart-outline.png',
                  width: 24,
                  height: 24,
                  color: kWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
