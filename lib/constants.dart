import 'package:flutter/material.dart';

const kBlue100 = Color(0xFFE9F2F9);
const kBlue200 = Color(0xFF0B59D5);
const kBlue300 = Color(0xFF0A50C0);
const kBlue400 = Color(0xFF0948AD);

const kGrey100 = Color(0xFFDCDCDC);
const kGrey200 = Color(0xFF999999);
const kGrey300 = Color(0xFF696E70);

const kBlack600 = Color(0xFF000000);

const kWhite = Color(0xFFFFFFFF);

const kYellow200 = Color(0xFFFCB61A);

const taxesPercent = 0.07;

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kBlue200,
    ),
    textTheme: buildTextTheme(base.textTheme),
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline2: base.headline2!.copyWith(
          fontSize: 16,
        ),
        headline3: base.headline3!.copyWith(
          fontSize: 14,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontSize: 12,
        ),
      )
      .apply(
        fontFamily: 'Ambit',
        displayColor: Colors.white,
      );
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
