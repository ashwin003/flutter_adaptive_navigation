import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Color color;
  final int index;
  const Cell({
    super.key,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Center(
        child: Text(index.toString()),
      ),
    );
  }
}
