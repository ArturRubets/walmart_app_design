import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final Image image;
  final String title;

  void _handleAddToCart(BuildContext context) {
    AppStateWidget.of(context).addValue();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleAddToCart(context),
      child: Container(
        width: 81,
        height: 34,
        decoration: BoxDecoration(
          color: kBlue200,
          borderRadius: BorderRadius.circular(200),
        ),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: image,
              flex: 1,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
