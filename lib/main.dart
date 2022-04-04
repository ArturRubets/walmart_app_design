import 'package:flutter/material.dart';
import 'package:walmart_app_design/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walmart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(color: Colors.red),
      initialRoute: '/splash',
      onGenerateRoute: _getRoute,
    );
  }

  Route? _getRoute(RouteSettings settings) {
    if (settings.name != '/splash') {
      return null;
    }
    return MaterialPageRoute(
      builder: ((context) => const SplashPage(duration: Duration(seconds: 3))),
    );
  }
}
