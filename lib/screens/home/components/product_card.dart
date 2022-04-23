import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/controllers/productController.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/screens/home/components/track_order/button.dart';

class ProductCard extends StatelessWidget {
  final Food food;

  const ProductCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: kWhite,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
            color: kWhite,
          ),
          width: 164,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  food.assetPath,
                  width: 126,
                  height: 118,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                food.note,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kGrey200),
              ),
              const SizedBox(height: 2),
              Text(
                food.productName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kBlack600),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: '\$${food.price}  ',
                  children: [
                    TextSpan(
                      text: '\$${food.pricePerWeight}/lb',
                      style: const TextStyle(color: kGrey100),
                    ),
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: kBlack600),
                ),
              ),
              const Divider(),
              Row(
                children: [
                  if (food.isStock)
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Spacer(),
                          const Text('|'),
                          const Spacer(),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/location_outline.png',
                          color: kBlack600,
                          width: 12,
                          height: 15,
                        ),
                        Text(
                          food.location,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: InkWell(
            onTap: () => ProductController.to.addToCart(food),
            child: Button(
              image: Image.asset(
                'assets/icons/coolicon.png',
                width: 12,
                height: 12,
              ),
              title: 'Add',
            ),
          ),
        ),
      ],
    );
  }
}
