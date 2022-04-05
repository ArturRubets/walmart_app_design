import 'package:flutter/material.dart';

class CardTopOffer extends StatelessWidget {
  const CardTopOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 21, bottom: 44, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/girls.png',
            width: 334,
            height: 190,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 334,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Assembly',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'A new brand that looks good.',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontFamily: 'Aeonik',
                              color: const Color(0xFF999999),
                            ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/circle_chevron_right.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 11),
        ],
      ),
    );
  }
}
