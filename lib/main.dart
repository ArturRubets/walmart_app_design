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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      initialBinding: BindingsBuilder(() {
        Get.put<ProductController>(ProductController());
        Get.put<PaymentController>(PaymentController());
      }),
      title: 'Walmart',
      home: const HomePage(),
      getPages: [
        GetPage(
          name: SplashPage.routeName,
          page: () => const SplashPage(duration: Duration(seconds: 2)),
        ),
        GetPage(
          name: Cart.routeName,
          page: () => const Cart(),
        ),
        GetPage(
          name: Checkout.routeName,
          page: () => Checkout(itemsInCart: Get.arguments as Map<Product, int>),
        ),
        GetPage(
          name: LoyaltyProgram.routeName,
          page: () => const LoyaltyProgram(),
        ),
        GetPage(
          name: HomePage.routeName,
          page: () => const HomePage(),
        ),
      ],
      theme: buildTheme(),
      scrollBehavior: const ConstantScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}
