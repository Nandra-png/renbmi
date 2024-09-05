import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final VoidCallback onToggle;

  GenderSelector({required this.isMale, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: onToggle,
        ),
        SizedBox(
          width: 200, // Set width to your preferred value
          height: 200, // Set height to your preferred value
          child: Image.asset(
            isMale ? 'assets/male.png' : 'assets/female.png',
            fit: BoxFit.contain, // Ensure the image fits well within the SizedBox
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: onToggle,
        ),
      ],
    );
  }
}
