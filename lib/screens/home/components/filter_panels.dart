import 'package:flutter/material.dart';
import 'package:walmart_app_design/screens/home/components/filter_panel.dart';

class FilterPanels extends StatelessWidget {
  const FilterPanels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterPanel(
            title: 'Sort & Filter',
            leading: Image.asset(
              'assets/icons/menu_alt_02.png',
              width: 15,
              height: 10,
            ),
          ),
          const SizedBox(width: 12),
          const FilterPanel(
            title: 'In-Store',
          ),
          const SizedBox(width: 12),
          const FilterPanel(
            title: 'Price',
          ),
        ],
      ),
    );
  }
}
