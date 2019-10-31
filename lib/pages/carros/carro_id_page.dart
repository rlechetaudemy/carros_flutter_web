
import 'package:carros_flutter_web/imports.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class CarroIdPage extends StatefulWidget {
  @override
  _CarroIdPageState createState() => _CarroIdPageState();
}

class _CarroIdPageState extends State<CarroIdPage> {
  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context).settings.name;

    Object args = ModalRoute.of(context).settings.arguments;

    String id = path.basename(name);

    Usuario user = AppModel.get(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Car"),
      ),
      body: Container(
        child: Text("$name ($id) - $args - user: $user"),
      ),
    );
  }
}
