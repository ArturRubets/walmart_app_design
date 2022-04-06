import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/offer.dart';
import 'package:walmart_app_design/screens/home/components/card_top_offer.dart';
import 'package:walmart_app_design/screens/home/components/extra_info.dart';
import 'package:walmart_app_design/screens/home/components/filter_panel.dart';
import 'package:walmart_app_design/screens/home/components/filter_panels.dart';
import 'package:walmart_app_design/screens/home/components/search.dart';
import 'package:walmart_app_design/screens/home/components/track_order/track_order.dart';

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
          color: kBlue200,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TrackOrder(),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: FilterPanels(),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Groceries ',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kBlack600),
                ),
                TextSpan(
                  text: '(12.3k)',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: kGrey100),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
