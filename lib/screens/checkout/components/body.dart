import 'package:flutter/material.dart';
import 'package:walmart_app_design/common/header_cart.dart';
import 'package:walmart_app_design/common/shipping_address.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/screens/checkout/components/item.dart';

class Body extends StatelessWidget {
  Body({
    required this.itemsInCart,
    Key? key,
  })  : assert(itemsInCart.isNotEmpty),
        super(key: key);

  final Map<Product, int> itemsInCart;

  @override
  Widget build(BuildContext context) {
    var products = itemsInCart.keys;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderCart(
          title: 'Checkout',
        ),
        const ShippingAddress(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              ..._buildItemsSection(products),
              const SizedBox(height: 7),
              const Text(
                'Payment method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildItemsSection(Iterable<Product> products) {
    return [
      const Text(
        'Items',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 10),
      ...List.generate(
        products.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Item(
            product: products.elementAt(index),
          ),
        ),
      )
    ];
  }
}
