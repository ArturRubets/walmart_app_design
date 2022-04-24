import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:walmart_app_design/screens/cart/components/body.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  static const routeName = '/cart';

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
                return const Body();
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
                'Hi, John',
                style: Theme.of(context).textTheme.headline3,
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
            onPressed: () => Get.back(),
            icon: Image.asset(
              'assets/icons/plus_circle_outline.png',
              width: 24,
              height: 24,
            ),
            splashRadius: 18,
          ),
        ),
      ),
    ],
  );
}
