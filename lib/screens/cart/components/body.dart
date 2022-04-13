import 'package:flutter/material.dart';
import 'package:walmart_app_design/common/rounded_button.dart';
import 'package:walmart_app_design/common/shipping_address.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/common/header_cart.dart';
import 'package:walmart_app_design/screens/cart/components/purchase_form.dart';
import 'package:walmart_app_design/screens/checkout/checkout.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quantityItemsInCart =
        AppStateWidget.of(context).quantityItemsInCart();
    final itemsInCart = AppStateScope.of(context).itemsInCart;

    return Column(
      children: [
        HeaderCart(title: 'Cart',itemsInCart: quantityItemsInCart),
        const ShippingAddress(),
        ...generatePurchases(itemsInCart),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: total(context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Checkout(itemsInCart: itemsInCart),
              ),
            ),
            child: const RoundedButton(
              text: 'Continue to checkout',
            ),
          ),
        ),
      ],
    );
  }

  Column total(BuildContext context) {
    var subtotal =
        AppStateWidget.of(context).calculateSubtotal().toStringAsFixed(2);
    var taxes = AppStateWidget.of(context).calcTaxes().toStringAsFixed(2);
    var total = AppStateWidget.of(context).calcTotal().toStringAsFixed(2);

    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Subtotal ',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: kBlack600),
                children: const [
                  TextSpan(
                    text: '(2 items)',
                    style: TextStyle(color: kGrey200),
                  ),
                ],
              ),
            ),
            Text(
              '\$$subtotal',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kBlack600,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Taxes',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kBlack600),
            ),
            Text(
              '\$$taxes',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kBlack600,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$$total',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> generatePurchases(Map<Product, int> items) {
    var products = items.keys;
    var quantityProducts = items.values;
    return List.generate(items.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 20,
        ),
        child: PurchaseForm(
          product: products.elementAt(index),
          quantity: quantityProducts.elementAt(index),
        ),
      );
    });
  }
}