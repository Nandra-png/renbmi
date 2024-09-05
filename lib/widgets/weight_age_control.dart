import 'package:flutter/material.dart';

class WeightAgeControl extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final TextStyle? textStyle; // Add this parameter

  WeightAgeControl({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.textStyle, // Initialize this parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 20), // Use textStyle if provided, otherwise default to white
        ),
        Text(
          value.toString(),
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 40), // Use textStyle if provided, otherwise default to white
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: onDecrement,
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
