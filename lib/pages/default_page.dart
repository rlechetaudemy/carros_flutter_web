
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Text("${constraints.maxWidth}/${constraints.maxHeight}"),
        );
      },
    );
  }
}
