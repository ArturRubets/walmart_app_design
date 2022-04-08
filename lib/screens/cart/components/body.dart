import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';
import 'package:walmart_app_design/screens/cart/components/header_cart.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemsInCart = AppStateWidget.of(context).itemsInCart();
    return Column(
      children: [
        HeaderCart(itemsInCart: itemsInCart),
        Ink(
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
                onTap: () {}, //=> Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
