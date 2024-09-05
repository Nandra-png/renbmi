import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  CustomCard({
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    this.padding = const EdgeInsets.all(6.0),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1E3044),
      child: Padding(
        padding: padding!,
        child: child,
      ),
    );
  }
}
