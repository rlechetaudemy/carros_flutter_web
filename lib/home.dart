
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Web - ${size.width}/${size.height}"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue[100],
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.grey[100],
          ),
        )
      ],
    );
  }
}
