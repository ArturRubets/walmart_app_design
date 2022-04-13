import 'package:walmart_app_design/model/payment.dart';

class PaymentRepository {
  static List<Payment> loadPayment() {
    const payments = [
      Payment(
        name: 'World Elite Visa',
        number: '5629 4045 2380',
        assetPath: ['assets/icons/payments/Card.png'],
      ),
      Payment(
        name: 'HSBC Master Card',
        number: '1937 5889 8790',
        assetPath: ['assets/icons/payments/Cards.png'],
      ),
      Payment(
        name: 'Buy Now Pay Later',
        number: '5629 4045 2380',
        assetPath: [
          'assets/icons/payments/Group 115.png',
          'assets/icons/payments/Group 114.png',
          'assets/icons/payments/Group 113.png',
        ],
      ),
      Payment(
        name: 'Paypal',
        number: '5629 4045 2380',
      ),
      Payment(
        name: 'Alipay',
        number: '5629 4045 2380',
      ),
      Payment(
        name: 'Venmo',
        number: '5629 4045 2380',
      ),
    ];
    return payments;
  }
}
