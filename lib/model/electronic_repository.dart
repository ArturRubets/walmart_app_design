import 'package:walmart_app_design/model/electronic.dart';

class ElectronicRepository {
  static List<Electronic> loadElectronic() {
    const allElectronic = [
      Electronic(
        id: 8,
        assetPath: 'assets/images/electronics_line/image 17 (8).png',
        productName: 'Apple Watch SE GPS',
        brand: 'Apple',
        pricePerMonth: 26,
        price: 279,
        quantityStars: 4,
        rating: 135,
      ),
      Electronic(
        id: 9,
        assetPath: 'assets/images/electronics_line/image 17 (9).png',
        productName: 'Canon EOS Rebel T100',
        brand: 'Canon',
        pricePerMonth: 36,
        price: 379,
        quantityStars: 3,
        rating: 1400,
      ),
      Electronic(
        id: 10,
        assetPath: 'assets/images/electronics_line/image 17 (10).png',
        productName: 'OnePlus Nord N200',
        brand: 'OnePlus',
        pricePerMonth: 21,
        price: 220,
        quantityStars: 3.5,
        rating: 70,
      ),
      Electronic(
        id: 11,
        assetPath: 'assets/images/electronics_line/image 17 (11).png',
        productName: 'Bomaker Projector',
        brand: 'Bomaker',
        pricePerMonth: 18.4,
        price: 320,
        quantityStars: 3,
        rating: 80,
      ),
      Electronic(
        id: 12,
        assetPath: 'assets/images/electronics_line/image 17 (12).png',
        productName: 'QuietComfort 45',
        brand: 'Bose',
        pricePerMonth: 24.8,
        price: 279,
        quantityStars: 4,
        rating: 135,
      ),
      Electronic(
        id: 13,
        assetPath: 'assets/images/electronics_line/image 17 (13).png',
        productName: 'Contixo F16 FPV',
        brand: 'Contixo',
        pricePerMonth: 10,
        price: 180,
        quantityStars: 4,
        rating: 135,
      ),
    ];
    return allElectronic;
  }
}
