import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/offer.dart';
import 'package:walmart_app_design/screens/home/components/card_top_offer.dart';
import 'package:walmart_app_design/screens/home/components/extra_info.dart';
import 'package:walmart_app_design/screens/home/components/search.dart';

class Body extends StatelessWidget {
  final List<Offer> offers;
  const Body({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: kBlue100,
          padding: const EdgeInsets.only(
            top: 21,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: const Search(),
        ),
        const ExtraInfo(),
        SizedBox(
          height: 316,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              offers.length,
              (index) => CardTopOffer(offer: offers[index]),
            ),
          ),
        ),
      ],
    );
  }
}
