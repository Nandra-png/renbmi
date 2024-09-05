import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final int height;
  final ValueChanged<int> onHeightChanged;
  final TextStyle? textStyle;

  HeightSlider({
    required this.height,
    required this.onHeightChanged,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height',
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 24), // Adjust font size
        ),
         SizedBox(height: 10),
        Text(
          '$height cm',
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 70), // Adjust font size
        ),
        Slider(
          value: height.toDouble(),
          min: 100,
          max: 220,
          onChanged: (value) => onHeightChanged(value.toInt()),
        ),
      ],
    );
  }
}
