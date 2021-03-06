import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:get/route_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.duration}) : super(key: key);
  final Duration duration;
  static const routeName = '/splash';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
    _comeBackToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _comeBackToHome() async {
    await Future.delayed(
      widget.duration,
      () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              semanticsLabel: 'Walmart logo',
              width: 88,
              height: 96,
            ),
          ),
        ),
      ),
    );
  }
}
