
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Text(
          "Flutter Web - ${size.width}/${size.height}",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
