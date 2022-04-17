import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/product_model.dart';
import 'package:walmart_app_design/screens/home/components/track_order/button.dart';

class ElectronicCard extends StatelessWidget {
  final Electronic electronic;
  final double opacityStar = 0.4;

  const ElectronicCard({
    Key? key,
    required this.electronic,
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
                  electronic.assetPath,
                  width: 126,
                  height: 118,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                electronic.brand,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kGrey200),
              ),
              const SizedBox(height: 2),
              Text(
                electronic.productName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kBlack600),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: '\$${electronic.pricePerMonth}/mo  ',
                  children: [
                    TextSpan(
                      text: '\$${electronic.price}',
                      style: const TextStyle(color: kGrey100),
                    ),
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: kBlack600),
                ),
              ),
              const Divider(indent: 0, endIndent: 0),
              Row(
                children: [
                  Opacity(
                    opacity: electronic.quantityStars >= 1 ? 1 : opacityStar,
                    child: Image.asset('assets/icons/Active.png'),
                  ),
                  Opacity(
                    opacity: electronic.quantityStars >= 2 ? 1 : opacityStar,
                    child: Image.asset('assets/icons/Active.png'),
                  ),
                  Opacity(
                    opacity: electronic.quantityStars >= 3 ? 1 : opacityStar,
                    child: Image.asset('assets/icons/Active.png'),
                  ),
                  Opacity(
                    opacity: electronic.quantityStars >= 4 ? 1 : opacityStar,
                    child: Image.asset('assets/icons/Active.png'),
                  ),
                  Opacity(
                    opacity: electronic.quantityStars >= 5 ? 1 : opacityStar,
                    child: Image.asset('assets/icons/Active.png'),
                  ),
                  const SizedBox(width: 10),
                  electronic.rating > 1000
                      ? Text(
                          '(${electronic.rating / 1000}k)',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: kGrey200),
                        )
                      : Text(
                          '(${electronic.rating})',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: kGrey200),
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
            onTap: () => Provider.of<ProductModel>(context, listen: false).addToCart(electronic),
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
