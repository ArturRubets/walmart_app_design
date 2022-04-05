import 'package:walmart_app_design/model/offer.dart';

class OffersRepository {
  static List<Offer> loadOffers() {
    const allOffers = [
      Offer(
        assetPath: 'assets/images/girls.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
      Offer(
        assetPath: 'assets/images/sport.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
      Offer(
        assetPath: 'assets/images/cake.png',
        title: 'Free Assembly',
        subTitle: 'A new brand that looks good.',
      ),
    ];
    return allOffers;
  }
}
