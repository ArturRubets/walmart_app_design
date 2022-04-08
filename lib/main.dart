import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';
import 'package:walmart_app_design/screens/home/home.dart';
import 'package:walmart_app_design/screens/splash/splash.dart';

void main() {
  runApp(
    const AppStateWidget(
      child: MyApp(),
    ),
  );
}

class AppState {
  const AppState({required this.value});

  final int value;

  AppState copyWith({int? value}) {
    return AppState(value: value ?? this.value);
  }
}

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  static _AppStateWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppStateWidgetState>()!;

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  AppState _model = AppState(
    value: 10,
  );

  void addValue() {
    setState(() {
      _model = _model.copyWith(
        value: _model.value + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _model,
      child: widget.child,
    );
  }
}

class AppStateScope extends InheritedWidget {
  final AppState data;
  const AppStateScope(
    this.data, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;

  @override
  bool updateShouldNotify(AppStateScope oldWidget) => data != oldWidget.data;
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
