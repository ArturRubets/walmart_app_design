import 'package:flutter/material.dart';
import 'package:walmart_app_design/main.dart';

class MyBadge extends StatelessWidget {
  final double top;
  final double right;
  final Widget child; // our badge widget will wrap this child widget
  final Color color; // the  background color of the badge - default is yellow

  const MyBadge({
    Key? key,
    required this.child,
    this.color = Colors.yellow,
    required this.top,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = AppStateScope.of(context).value;
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: right,
          top: top,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
