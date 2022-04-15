import 'package:flutter/material.dart';
import 'package:walmart_app_design/common/header_cart.dart';
import 'package:walmart_app_design/common/rounded_button.dart';
import 'package:walmart_app_design/common/shipping_address.dart';
import 'package:walmart_app_design/common/summary.dart';
import 'package:walmart_app_design/main.dart';
import 'package:walmart_app_design/model/payment.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/screens/checkout/components/item.dart';
import 'package:walmart_app_design/screens/checkout/components/payment_method.dart';
import 'package:walmart_app_design/screens/loyalty_program/loyalty_program.dart';

class Body extends StatelessWidget {
  const Body({required this.itemsInCart, Key? key}) : super(key: key);
  final Map<Product, int> itemsInCart;

  @override
  Widget build(BuildContext context) {
    var products = itemsInCart.keys;
    var payments = AppStateScope.of(context).paymentList;

    var subtotal =
        AppStateWidget.of(context).calculateSubtotal().toStringAsFixed(2);
    var taxes = AppStateWidget.of(context).calcTaxes().toStringAsFixed(2);
    var total = AppStateWidget.of(context).calcTotal().toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderCart(
          title: 'Checkout',
        ),
        const ShippingAddress(),
        _buildItemsSection(products),
        _buildPaymentSection(payments),
        const SizedBox(height: 38),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Summary(
            subtotal: subtotal,
            taxes: taxes,
            total: total,
          ),
        ),
        const SizedBox(height: 42),
        _buildButtonToContinue(context),
        const SizedBox(height: 24),
      ],
    );
  }

  Padding _buildButtonToContinue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoyaltyProgram(),
          ),
        ),
        child: const RoundedButton(
          text: 'Continue 👉',
        ),
      ),
    );
  }

  Padding _buildItemsSection(Iterable<Product> products) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
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
          ),
        ],
      ),
    );
  }

  Padding _buildPaymentSection(List<Payment> payments) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PaymentMethod(payments: payments),
    );
  }
}
