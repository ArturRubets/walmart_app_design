import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/offer.dart';

class CardTopOffer extends StatelessWidget {
  final Offer offer;
  const CardTopOffer({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 21, bottom: 44, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            offer.assetPath,
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
                        offer.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        offer.subTitle,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontFamily: 'Aeonik',
                              color: kGrey100,
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
