
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _font()
        ],
      ),
    );
  }

  _font() {
    return Card(
      child: Column(
        children: <Widget>[
          Text("Font Family: ${Theme.of(context).textTheme.body1.fontFamily}"),
          Text("Flutter Web"),
          Text("Flutter Web",style: TextStyle(fontFamily:"Roboto"),),
          Text("Flutter Web",style: TextStyle(fontFamily: "Mansalva"),),
          Text("Flutter Web",style: TextStyle(fontFamily: "Raleway"),),
        ],
      ),
    );
  }
}
