import 'package:carros_flutter_web/constants.dart';
import 'package:carros_flutter_web/web/header.dart';
import 'package:carros_flutter_web/web/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;

  bool get showMenu => size.width > 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue,
      width: size.width,
      height: headerHeight,
      child: Header(),
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - headerHeight,
      child: showMenu
          ? Row(
              children: <Widget>[
                _menu(),
                _right(),
              ],
            )
          : _right(),
    );
  }

  _menu() {
    return Container(
      width: menuWidth,
      color: Colors.blue[100],
      child: Menu(),
    );
  }

  _right() {

    double width = showMenu ? size.width - menuWidth : size.width;

    int columns = 1;

    if(width <= 500) {
      columns = 1;
    } else if(width < 1000) {
      columns = 2;
    } else {
      columns = 3;
    }

    return Container(
      padding: EdgeInsets.all(16),
      width: width,
      color: Colors.grey,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 2,
        ),
        itemCount: 100,
        itemBuilder: (context, idx) {
          return Container(
            height: 150,
            child: Card(
              child: Center(
                child: Text("$width"),
              ),
            ),
          );
        },
      ),
    );
  }
}
