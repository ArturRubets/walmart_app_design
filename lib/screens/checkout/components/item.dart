import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/product.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      width: 281,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromRGBO(20, 64, 86, 0.1),
                style: BorderStyle.solid,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                product.assetPath,
                width: 56,
                height: 56,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              Text(
                '10 Loyalty Points',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kGrey200),
              ),
              const Spacer(),
              Text(product.productName),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
