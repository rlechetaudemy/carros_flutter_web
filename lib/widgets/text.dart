import 'package:flutter/material.dart';

Text text(
  String s, {
  double fontSize,
  color,
  bold = false,
      underline = false
}) {

  if(s == "null") {
    // Corrigir problema do servidor
    s = "";
  }

  return Text(
    s ?? "",
    //overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      decoration: underline ? TextDecoration.underline : null
    ),
  );
}
