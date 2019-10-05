import 'package:flutter/material.dart';

Text text(String s, {
  double fontSize,
  color,
  bold = false,
  underline = false,
  int maxLines = 1,
  bool ellipsis = true,
}) {
  if (s == "null") {
    // Corrigir problema do servidor
    s = "";
  }

  return Text(
    s ?? "",
    maxLines: maxLines,
    overflow: ellipsis ? TextOverflow.ellipsis : TextOverflow.clip,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      decoration: underline ? TextDecoration.underline : null,
    ),
  );
}
