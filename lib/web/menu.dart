
import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/pages/carros_page.dart';
import 'package:carros_flutter_web/pages/default_page.dart';
import 'package:carros_flutter_web/pages/usuarios_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _itemMenu("Home", FontAwesomeIcons.home, DefaultPage()),
        _itemMenu("Carros", FontAwesomeIcons.car, CarrosPage()),
        _itemMenu("Usuários", FontAwesomeIcons.user, UsuariosPage()),
      ],
    );
  }

  _itemMenu(String title, IconData icon, Widget page) {

    bool b = title == selected;

    return Material(
      color: b ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.setPage(page);

          setState(() {
            this.selected = title;
          });
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(title, style: TextStyle(fontWeight: b ? FontWeight.bold : FontWeight.normal),),
        ),
      ),
    );
  }
}
