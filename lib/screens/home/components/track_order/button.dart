import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              style: Theme.of(context).textTheme.headline3,
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
