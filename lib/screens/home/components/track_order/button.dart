import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class Button extends StatelessWidget {
  final Image image;
  final String title;

  const Button({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

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
              style: Theme.of(context).textTheme.headline2,
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
