import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/screens/home/components/track_order/path_order.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your order is on the way',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  'Arrives today, 3pm – 4pm',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: kGrey100,
                        fontFamily: 'Aeonik',
                      ),
                ),
              ],
            ),
            Container(
              width: 81,
              height: 34,
              decoration: BoxDecoration(
                color: kBlue200,
                borderRadius: BorderRadius.circular(200),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/location_outline.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Track',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const PathOrder(),
      ],
    );
  }
}
