import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  const Brands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/images/brands/storeCircleLogos.png',
            width: 72,
            height: 72,
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/images/brands/storeCircleLogos (1).png',
            width: 72,
            height: 72,
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/images/brands/storeCircleLogos (2).png',
            width: 72,
            height: 72,
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/images/brands/storeCircleLogos (3).png',
            width: 72,
            height: 72,
          ),
        ],
      ),
    );
  }
}
