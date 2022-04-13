import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({
    Key? key,
    required this.title,
    this.itemsInCart,
  }) : super(key: key);

  final String title;
  final int? itemsInCart;

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
          text: title,
          style: const TextStyle(
            fontSize: 32,
            color: kWhite,
            fontFamily: 'Ambit',
            fontWeight: FontWeight.bold,
          ),
          children: [
            if (itemsInCart != null)
              TextSpan(
                text: ' •',
                style: TextStyle(
                  color: kWhite.withOpacity(0.4),
                ),
              ),
            if (itemsInCart != null)
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
