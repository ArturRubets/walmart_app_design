import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 48,
      decoration: BoxDecoration(
        color: kBlue200,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
