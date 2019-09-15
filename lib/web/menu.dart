
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _itemMenu("Home", FontAwesomeIcons.home),
        _itemMenu("Carros", FontAwesomeIcons.car),
        _itemMenu("Usuários", FontAwesomeIcons.user),
      ],
    );
  }

  _itemMenu(String title, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {

        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}
