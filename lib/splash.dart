import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.duration}) : super(key: key);
  final Duration duration;
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
      () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFF0B59D5)),
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
              'assets/logo.svg',
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
