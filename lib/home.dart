
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

    Size size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Container(
          width: 230,
          color: Colors.blue[100],
        ),
        Container(
          width: size.width - 230,
          color: Colors.grey,
        )
      ],
    );
  }
}
