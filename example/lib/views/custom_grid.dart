import 'package:flutter/material.dart';

import 'cell.dart';

class CustomGridView extends StatelessWidget {
  final int count;
  final Color color;
  const CustomGridView({
    super.key,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 5,
      children: List.generate(
        count,
        (index) => Cell(
          color: color,
          index: index,
        ),
      ).toList(),
    );
  }
}
