import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    Key? key,
    required this.child,
    this.color = Colors.yellow,
    required this.top,
    required this.right,
    required this.itemsInCart,
  }) : super(key: key);

  final double top;
  final double right;
  final Widget child; // our badge widget will wrap this child widget
  final Color color; // the  background color of the badge - default is yellow
  final int itemsInCart;

  @override
  Widget build(BuildContext context) {
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
                '$itemsInCart',
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
