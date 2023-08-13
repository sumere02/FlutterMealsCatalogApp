import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.label, required this.icon, super.key});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
