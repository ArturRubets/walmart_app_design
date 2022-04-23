import 'dart:collection';
import 'package:get/get.dart';
import 'package:walmart_app_design/model/payment.dart';
import 'package:walmart_app_design/model/payment_repository.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.find();
  final _payment = PaymentRepository.load().obs;
  UnmodifiableListView<Payment> get payment => UnmodifiableListView(_payment);

  void addPayment(
      {required String name, required String number, List<String>? assetPath}) {
    if (name.isEmpty) {
      throw 'Empty name';
    }
    if (number.length != 14) {
      throw 'Invalid value number. Must be 14 characters #### #### #### ####';
    }
    var newPayment = Payment(name: name, number: number);
    _payment.add(newPayment);
  }
}
