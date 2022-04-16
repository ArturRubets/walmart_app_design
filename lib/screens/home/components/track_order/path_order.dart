import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class PathOrder extends StatelessWidget {
  const PathOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: kBlue200,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: kBlue200,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: kBlue200,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: kBlue200,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: kBlue200,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: kWhite,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: kBlue200,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: kGrey300,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: kGrey300,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        DefaultTextStyle(
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: kGrey300),
          child: Row(
            children: const [
              Text('Placed'),
              Spacer(),
              SizedBox(width: 30),
              Text('Preparing'),
              Spacer(),
              SizedBox(width: 30),
              Text('On the way', style: TextStyle(color: kBlue400)),
              Spacer(),
              Text('Delivered'),
            ],
          ),
        ),
      ],
    );
  }
}
