import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class Summary extends StatelessWidget {
  const Summary({
    Key? key,
    required this.subtotal,
    required this.taxes,
    required this.total,
  }) : super(key: key);

  final String subtotal;
  final String taxes;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Subtotal ',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: kBlack600),
                children: const [
                  TextSpan(
                    text: '(2 items)',
                    style: TextStyle(color: kGrey200),
                  ),
                ],
              ),
            ),
            Text(
              '\$$subtotal',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kBlack600,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Taxes',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kBlack600),
            ),
            Text(
              '\$$taxes',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: kBlack600,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$$total',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
