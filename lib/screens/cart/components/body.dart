import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart_app_design/common/rounded_button.dart';
import 'package:walmart_app_design/common/shipping_address.dart';
import 'package:walmart_app_design/common/summary.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/common/header_cart.dart';
import 'package:walmart_app_design/model/product_model.dart';
import 'package:walmart_app_design/screens/cart/components/purchase_form.dart';
import 'package:walmart_app_design/screens/checkout/checkout.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productModel = Provider.of<ProductModel>(context);

    final quantityItemsInCart = productModel.quantityItemsInCart();
    final itemsInCart = productModel.itemsInCart;
    var subtotal = productModel.calculateSubtotal().toStringAsFixed(2);
    var taxes = productModel.calcTaxes().toStringAsFixed(2);
    var total = productModel.calcTotal().toStringAsFixed(2);
    return Column(
      children: [
        HeaderCart(title: 'Cart', itemsInCart: quantityItemsInCart),
        const ShippingAddress(),
        ...generatePurchases(itemsInCart),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Summary(
            subtotal: subtotal,
            taxes: taxes,
            total: total,
          ),
        ),
        _buildButtonContinueToCheckout(context, itemsInCart),
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
          index: index,
        ),
      );
    });
  }

  Padding _buildButtonContinueToCheckout(
      BuildContext context, Map<Product, int> itemsInCart) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          Checkout.routeName,
          arguments: itemsInCart,
        ),
        child: const RoundedButton(
          text: 'Continue to checkout',
        ),
      ),
    );
  }
}
