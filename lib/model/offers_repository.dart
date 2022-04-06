import 'package:walmart_app_design/model/offer.dart';

class OffersRepository {
  static List<Offer> loadOffers() {
    const allOffers = [
      Offer(
        assetPath: 'assets/images/offer_card/girls.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
      Offer(
        assetPath: 'assets/images/offer_card/sport.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
      Offer(
        assetPath: 'assets/images/offer_card/cake.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
    ];
    return allOffers;
  }
}
