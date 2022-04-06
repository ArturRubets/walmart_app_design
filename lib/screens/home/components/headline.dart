import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class Headline extends StatelessWidget {
  final String title;
  final bool isRating;
  final double? rating;

  const Headline({
    Key? key,
    required this.title,
    required this.isRating,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: kBlack600),
          ),
          if(isRating)
          TextSpan(
            text: ' (${rating}k)',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: kGrey100),
          ),
        ],
      ),
    );
  }
}
