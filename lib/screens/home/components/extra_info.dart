import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: kBlue200,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Image.asset(
                  'assets/icons/home_outline.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  'Carrollton Supercenter',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontFamily: 'Aeonik',
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: kBlue300,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Image.asset(
                  'assets/icons/location_outline.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  'Dallas 75220',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontFamily: 'Aeonik',
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
