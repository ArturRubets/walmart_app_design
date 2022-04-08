import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/screens/cart/components/body.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: buildAppBar(context),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Body();
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

Row buildAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          children: [
            Image.asset(
              'assets/icons/avatar.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Hi, Artur',
                style: Theme.of(context).textTheme.headline2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          semanticsLabel: 'Walmart logo',
          width: 36,
          height: 36,
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/icons/plus_circle_outline.png',
              width: 24,
              height: 24,
            ),
            splashRadius: 16,
          ),
        ),
      ),
    ],
  );
}
