import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/main.dart';
import 'package:walmart_app_design/model/electronic.dart';
import 'package:walmart_app_design/model/food.dart';
import 'package:walmart_app_design/model/offers_repository.dart';
import 'package:walmart_app_design/screens/home/components/body.dart';
import 'package:walmart_app_design/screens/home/components/my_badge.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: buildAppBar(context),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Body(
                  offers: OffersRepository.loadOffers(),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Row buildAppBar(BuildContext context) {
    return Row(
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
                  .copyWith(color: kWhite.withOpacity(0.8)),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                AppStateScope.of(context).itemsInCart.forEach((element) {
                  if (element is Food) {
                    inspect(element as Food);
                  } else if (element is Electronic) {
                    inspect(element as Electronic);
                  }
                });
              },
              child: MyBadge(
                top: -6,
                right: -6,
                color: const Color(0xFFFCB619),
                child: Image.asset(
                  'assets/icons/shopping-cart-outline.png',
                  width: 24,
                  height: 24,
                  color: kWhite,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
