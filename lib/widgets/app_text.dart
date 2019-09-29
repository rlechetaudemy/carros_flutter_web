import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  bool bold;

  AppText(
    this.text, {
    this.fontSize = 16,
    this.color = Colors.black,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
