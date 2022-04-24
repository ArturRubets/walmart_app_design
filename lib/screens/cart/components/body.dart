import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:walmart_app_design/common/rounded_button.dart';
import 'package:walmart_app_design/common/shipping_address.dart';
import 'package:walmart_app_design/common/summary.dart';
import 'package:walmart_app_design/controllers/productController.dart';
import 'package:walmart_app_design/model/product.dart';
import 'package:walmart_app_design/common/header_cart.dart';
import 'package:walmart_app_design/screens/cart/components/purchase_form.dart';
import 'package:walmart_app_design/screens/checkout/checkout.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsInCart = ProductController.to.itemsInCart;
    return Column(
      children: [
        Obx(
          () => HeaderCart(
            title: 'Cart',
            itemsInCart: ProductController.to.quantityItemsInCart().value,
          ),
        ),
        const ShippingAddress(),
        generatePurchases(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Summary(
              subtotal:
                  ProductController.to.calculateSubtotal().toStringAsFixed(2),
              taxes: ProductController.to.calcTaxes().toStringAsFixed(2),
              total: ProductController.to.calcTotal().toStringAsFixed(2),
            ),
          ),
        ),
        _buildButtonContinueToCheckout(context, itemsInCart),
      ],
    );
  }

  Widget generatePurchases() {
    return Obx(() {
      var products = ProductController.to.itemsInCart.keys;
      return Column(
        children: [
          ...List.generate(products.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 32,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: PurchaseForm(
                product: products.elementAt(index),
              ),
            );
          }),
        ],
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
        onTap: () => Get.toNamed(Checkout.routeName, arguments: itemsInCart),
        child: const RoundedButton(
          text: 'Continue to checkout',
        ),
      ),
    );
  }
}
