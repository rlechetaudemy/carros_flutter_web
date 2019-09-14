
import 'package:carros_flutter_web/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;

  bool get showDrawer => size.width <= 760;

  //Text("Flutter Web - ${size.width}/${size.height}")

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: size.width,
            height: 80,
          ),
          Container(
            width: size.width,
            height: size.height - 80,
            child: Row(
              children: <Widget>[
                showDrawer ? Container() : _menu(),
                _right()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _menu() {
    return Container(
        width: menuWidth,
        color: Colors.blue[100],
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Item 1"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Item 2"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Item 3"),
            )
          ],
        ),
      );
  }

  _right() {

    return Container(
        width: showDrawer ? size.width : size.width - menuWidth,
        color: Colors.grey,
      );
  }
}
