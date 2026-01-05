import 'package:flutter/material.dart';
import '../models/onboard_model.dart';

class OnboardItem extends StatelessWidget {
  final OnboardModel model;

  const OnboardItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Image.asset(model.image, height: 260),
        const SizedBox(height: 30),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
