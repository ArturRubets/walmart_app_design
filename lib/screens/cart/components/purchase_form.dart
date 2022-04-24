import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/controllers/productController.dart';
import 'package:walmart_app_design/model/product.dart';

class PurchaseForm extends StatelessWidget {
  const PurchaseForm({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var productModel = ProductController.to;
    var addToCart = productModel.addToCart;
    var removeFromCart = productModel.removeFromCart;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.assetPath),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: kBlack600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: kBlack600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kYellow200,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '10 Loyalty Points',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        const MyExpansionPanelList(),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => removeFromCart(
                      product,
                      ProductController.to
                          .quantityItemsInCartByProduct(product)
                          .value),
                  child: Text(
                    'Remove',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: kBlack600,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Save for later',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: kBlack600,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
            Container(
              width: 127,
              height: 41,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kBlack600,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      removeFromCart(product, 1);
                    },
                    icon: const Icon(Icons.remove),
                    splashRadius: 15,
                  ),
                  Obx(() {
                    return Text(
                      '${ProductController.to.quantityItemsInCartByProduct(product)}',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: kBlack600,
                            fontWeight: FontWeight.w400,
                          ),
                    );
                  }),
                  IconButton(
                    onPressed: () => addToCart(product),
                    icon: const Icon(Icons.add),
                    splashRadius: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({
    Key? key,
  }) : super(key: key);

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Protect your purchase',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: kBlack600,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Ambit',
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Get the best value on product protection',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kGrey200),
              )
            ],
          ),
          body: Wrap(
            children: const [
              Text(
                'Protect your purchase. Get the best value on product protection',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          isExpanded: _isOpen,
        ),
      ],
      expansionCallback: (i, isOpen) => setState(() {
        _isOpen = !_isOpen;
      }),
    );
  }
}