import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/offer.dart';
import 'package:walmart_app_design/screens/home/components/brands.dart';
import 'package:walmart_app_design/screens/home/components/card_top_offer.dart';
import 'package:walmart_app_design/screens/home/components/electronic_card.dart';
import 'package:walmart_app_design/screens/home/components/extra_info.dart';
import 'package:walmart_app_design/screens/home/components/filter_panels.dart';
import 'package:walmart_app_design/screens/home/components/headline.dart';
import 'package:walmart_app_design/screens/home/components/product_card.dart';
import 'package:walmart_app_design/screens/home/components/search.dart';
import 'package:walmart_app_design/screens/home/components/track_order/track_order.dart';

class Body extends StatelessWidget {
  final List<Offer> offers;
  final List<Food> foods;
  final List<Electronic> electronic;

  const Body({
    Key? key,
    required this.offers,
    required this.foods,
    required this.electronic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearch(),
            const ExtraInfo(),
            buildCardsOffers(),
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
            ...buildFoodGroseriesSection(),
            const SizedBox(height: 32),
            ...buildBrandsSection(),
            const SizedBox(height: 56),
            ...buildElectronicsGroseriesSection(),
          ],
        ),
      ),
    );
  }

  SizedBox buildCardsOffers() {
    return SizedBox(
      height: 316,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          offers.length,
          (index) => CardTopOffer(offer: offers[index]),
        ),
      ),
    );
  }

  Container buildSearch() {
    return Container(
      color: kBlue200,
      padding: const EdgeInsets.only(
        top: 21,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: const Search(),
    );
  }

  List<Widget> buildFoodGroseriesSection() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Headline(
          title: 'Groceries',
          isRating: true,
          rating: 12.3,
        ),
      ),
      const SizedBox(height: 12),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              foods.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ProductCard(food: foods[index]),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    ];
  }

  List<Widget> buildElectronicsGroseriesSection() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Headline(
          title: 'Groceries',
          isRating: true,
          rating: 12.3,
        ),
      ),
      const SizedBox(height: 12),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              electronic.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ElectronicCard(electronic: electronic[index]),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    ];
  }

  List<Widget> buildBrandsSection() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Headline(
          title: 'Brands',
          isRating: false,
        ),
      ),
      const SizedBox(height: 24),
      const Brands(),
    ];
  }
}
