import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  final String skey;

  const TextFieldBox(this.skey);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 540,
      height: 40,
      child: TextField(
        key: Key(skey),
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
