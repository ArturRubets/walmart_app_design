import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/purchase_position.dart';

class PurchaseForm extends StatelessWidget {
  const PurchaseForm({
    Key? key,
    required this.purchase,
  }) : super(key: key);

  final PurchasePosition purchase;

  @override
  Widget build(BuildContext context) {
    var item = purchase.product;
    var quantity = purchase.quantity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item.assetPath),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: kBlack600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${item.price}',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Protect your purchase',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: kBlack600,
                        fontWeight: FontWeight.w400,
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
            const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
            )
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Remove',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: kBlack600,
                        decoration: TextDecoration.underline,
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
                  const Icon(Icons.remove),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: kBlack600,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const Icon(Icons.add)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
