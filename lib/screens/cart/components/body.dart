import 'package:flutter/material.dart';
import 'package:walmart_app_design/common/rounded_button.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';
import 'package:walmart_app_design/model/purchase_position.dart';
import 'package:walmart_app_design/screens/cart/components/header_cart.dart';
import 'package:walmart_app_design/screens/cart/components/purchase_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quantityItemsInCart = AppStateWidget.of(context).itemsInCart();
    final items = AppStateWidget.of(context).getPurchases();
    return Column(
      children: [
        HeaderCart(itemsInCart: quantityItemsInCart),
        const ShippingAddress(),
        ...generatePurchases(items),
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
            onTap: () {},
            child: const RoundedButton(
              text: 'Continue to checkout',
            ),
          ),
        ),
      ],
    );
  }

  Column total(BuildContext context) {
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
              '\$499.60',
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
              '\$41.40',
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
          children: const [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$541.00',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> generatePurchases(List<PurchasePosition> items) {
    return List.generate(items.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 20,
        ),
        child: PurchaseForm(
          purchase: items[index],
        ),
      );
    });
  }
}

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        bottom: 16,
        right: 28,
      ),
      color: kBlue100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shipping  👉  Dallas 75220 (In-Store)',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: kBlack600),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
