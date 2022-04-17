import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/payment_model.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/model/product_model.dart';
import 'package:walmart_app_design/screens/cart/cart.dart';
import 'package:walmart_app_design/screens/checkout/checkout.dart';
import 'package:walmart_app_design/screens/home/components/my_badge.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/loyalty_program/loyalty_program.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductModel()),
        ChangeNotifierProvider(create: (_) => PaymentModel()),
      ],
      child: const MyApp(),
    ),
  );
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
        Provider.of<ProductModel>(context, listen: false).clearItemsInCart();
      }
      return MaterialPageRoute(builder: (context) => const HomePage());
    }
    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}

Row buildAppBar(BuildContext context) {
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
            Consumer<ProductModel>(builder: (context, product, child) {
              final productsInCart = product.quantityProductsInCart();
              return InkWell(
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
              );
            }),
          ],
        ),
      ),
    ],
  );
}
