import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemsInCart = AppStateWidget.of(context).itemsInCart();
    return Column(
      children: [
        Container(
          color: kBlue200,
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 16,
            top: 24,
            bottom: 16,
          ),
          child: RichText(
            text: TextSpan(
              text: 'Cart',
              style: TextStyle(
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
        ),
      ],
    );
  }
}
