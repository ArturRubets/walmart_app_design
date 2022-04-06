import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        fillColor: kWhite,
        filled: true,
        hintText: 'Search everything at Walmart',
        hintStyle: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: kGrey200),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/icons/search.png',
            width: 24,
            height: 24,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/icons/barcode.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
