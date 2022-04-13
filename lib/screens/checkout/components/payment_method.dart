import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/payment.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({required this.payments, Key? key}) : super(key: key);
  final List<Payment> payments;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _radioVal = 0;

  @override
  Widget build(BuildContext context) {
    var payments = widget.payments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment method',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        ...List.generate(
          payments.length,
          (index) => Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  payments.elementAt(index).name,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: kBlack600,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text(
                  payments
                      .elementAt(index)
                      .number
                      .replaceRange(0, 6, '**** **'),
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: kGrey200,
                      ),
                ),
                leading: Transform.scale(
                  scale: 1.2,
                  child: Radio<int>(
                    value: index,
                    groupValue: _radioVal,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          _radioVal = value;
                        });
                      }
                    },
                    activeColor: kBlue600,
                  ),
                ),
                trailing: SizedBox(
                  width: 100,
                  height: 64,
                  child: buildPaymentPicture(payments[index]),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/plus_circle.png'),
              const SizedBox(width: 8),
              Text(
                'Add a credit or debit card',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: kBlack600,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget? buildPaymentPicture(Payment payment) {
    var assetPath = payment.assetPath;
    if (assetPath == null) {
      return null;
    } else if (assetPath.length == 1) {
      return Transform.scale(
        scale: 2,
        child: Image.asset(
          assetPath.first,
        ),
      );
    } else if (assetPath.length == 3) {
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            right: 0,
            child: Image.asset(
              assetPath[2],
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            right: 25,
            child: Image.asset(
              assetPath[1],
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            right: 50,
            child: Image.asset(
              assetPath[0],
              width: 40,
              height: 40,
            ),
          ),
        ],
      );
    }
    return null;
  }
}
