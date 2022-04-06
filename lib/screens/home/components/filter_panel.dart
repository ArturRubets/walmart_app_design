import 'package:flutter/material.dart';
import 'package:walmart_app_design/constants.dart';

class FilterPanel extends StatelessWidget {
  final Image? leading;
  final String title;

  const FilterPanel({
    this.leading,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 34,
          decoration: BoxDecoration(
              color: kBlue100, borderRadius: BorderRadius.circular(200)),
          child: Row(
            children: [
              if (leading != null) ...[
                const SizedBox(width: 8),
                leading!,
                const SizedBox(width: 8),
              ] else
                const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: kBlack600),
              ),
              const SizedBox(width: 6),
              Image.asset(
                'assets/icons/ant-menu-submenu-arrow-down.png',
                width: 10,
                height: 9,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}
