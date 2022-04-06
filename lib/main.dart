import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ConstantScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Walmart',
      theme: _buildTheme(),
      home: const HomePage(),
      initialRoute: '/splash',
      onGenerateRoute: _getRoute,
    );
  }

  Route? _getRoute(RouteSettings settings) {
    if (settings.name != '/splash') {
      return null;
    }
    return MaterialPageRoute(
      builder: ((context) => const SplashPage(duration: Duration(seconds: 2))),
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kBlue200,
    ),
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline2: base.headline2!.copyWith(
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
