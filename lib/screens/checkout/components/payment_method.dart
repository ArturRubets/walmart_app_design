import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/model/payment.dart';
import 'package:walmart_app_design/model/payment_model.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _radioVal = 0;
  final _controllerNameCard = TextEditingController();
  final _controllerNumberCard = TextEditingController();

  @override
  void dispose() {
    _controllerNameCard.dispose();
    _controllerNumberCard.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentModel>(
      builder: (context, paymentModel, child) {
        var payments = paymentModel.payment;
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
              onTap: () async => await openDialog(),
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
      },
    );
  }

  Future<void> openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Add credit card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                controller: _controllerNameCard,
                decoration: const InputDecoration(
                  hintText: 'Enter name card',
                ),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _controllerNumberCard,
                decoration: const InputDecoration(
                  hintText: 'Enter number card',
                ),
                onSubmitted: (_) => _submit(),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            TextButton(
              onPressed: _cancel,
              child: const Text('CANCEL'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(kBlue100),
                backgroundColor: MaterialStateProperty.all(kBlue200),
              ),
            ),
            TextButton(
              onPressed: _submit,
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      );

  void _cancel() {
    _controllerNameCard.clear();
    _controllerNumberCard.clear();
    Navigator.of(context).pop();
  }

  void _submit() {
    try {
      var nameCard = _controllerNameCard.text;
      var numberCard = _controllerNumberCard.text;
      if (nameCard.isNotEmpty && numberCard.isNotEmpty) {
        Provider.of<PaymentModel>(context, listen: false)
            .addPayment(name: nameCard, number: numberCard);
        _controllerNameCard.clear();
        _controllerNumberCard.clear();
        Navigator.of(context).pop();
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(
          e.toString(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
