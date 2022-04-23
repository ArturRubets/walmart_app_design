import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/controllers/paymentController.dart';
import 'package:walmart_app_design/controllers/productController.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/screens/cart/cart.dart';
import 'package:walmart_app_design/screens/checkout/checkout.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/loyalty_program/loyalty_program.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';

void main() {
  Get.put(ProductController());
  Get.put(PaymentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walmart',
      home: const HomePage(),
      initialRoute: '/splash',
      onGenerateRoute: (settings) => _getRoute(settings, context),
      theme: buildTheme(),
      scrollBehavior: const ConstantScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }

  Route? _getRoute(RouteSettings settings, BuildContext context) {
    if (settings.name == SplashPage.routeName) {
      return MaterialPageRoute(
        builder: ((context) =>
            const SplashPage(duration: Duration(seconds: 2))),
      );
    }

    if (settings.name == Cart.routeName) {
      return MaterialPageRoute(
        builder: (context) => const Cart(),
      );
    }

    if (settings.name == Checkout.routeName) {
      final itemsInCart = settings.arguments as Map<Product, int>;
      return MaterialPageRoute(builder: (context) {
        return Checkout(itemsInCart: itemsInCart);
      });
    }

    if (settings.name == LoyaltyProgram.routeName) {
      return MaterialPageRoute(
        builder: (context) => const LoyaltyProgram(),
      );
    }

    if (settings.name == HomePage.routeName) {
      final isClearCart = settings.arguments as bool;
      if (isClearCart) {
        // remove items in cart
        ProductController.to.clearItemsInCart();
      }
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
