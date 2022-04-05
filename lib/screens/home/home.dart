import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walmart_app_design/screens/home/components/body.dart';
import 'package:walmart_app_design/screens/home/components/my_badge.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/avatar.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              Text(
                'Hi, John',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            semanticsLabel: 'Walmart logo',
            width: 36,
            height: 36,
          ),
          Row(
            children: [
              Text(
                '\$499.60',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white.withOpacity(0.8)),
              ),
              const SizedBox(width: 20),
              MyBadge(
                value: "2",
                top: -6,
                right: -6,
                color: const Color(0xFFFCB619),
                child: Image.asset(
                  'assets/icons/shopping-cart-outline.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
