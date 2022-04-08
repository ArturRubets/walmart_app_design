import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({
    Key? key,
    required this.itemsInCart,
  }) : super(key: key);

  final int itemsInCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlue200,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16,
        top: 24,
        bottom: 16,
      ),
      child: RichText(
        text: TextSpan(
          text: 'Cart',
          style: const TextStyle(
            fontSize: 32,
            color: kWhite,
            fontFamily: 'Ambit',
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: ' •',
              style: TextStyle(
                color: kWhite.withOpacity(0.4),
              ),
            ),
            TextSpan(
              text: ' $itemsInCart',
              style: TextStyle(
                color: kWhite.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
