import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int index;
  final int current;

  const PageIndicator({
    super.key,
    required this.index,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: current == index ? 10 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: current == index ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
