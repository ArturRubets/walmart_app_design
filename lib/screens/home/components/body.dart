import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/offer.dart';
import 'package:walmart_app_design/model/product_model.dart';
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

  const Body({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ...buildFoodGroseriesSection(context),
        const SizedBox(height: 32),
        ...buildBrandsSection(),
        const SizedBox(height: 56),
        ...buildElectronicsGroseriesSection(context),
        const SizedBox(height: 50),
      ],
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

  List<Widget> buildFoodGroseriesSection(BuildContext context) {
    var foodList = Provider.of<ProductModel>(context, listen: false).food;
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
              foodList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ProductCard(food: foodList[index]),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    ];
  }

  List<Widget> buildElectronicsGroseriesSection(BuildContext context) {
    var electronicList =
        Provider.of<ProductModel>(context, listen: false).electronic;
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
              electronicList.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ElectronicCard(electronic: electronicList[index]),
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
