
import 'package:carros_flutter_web/web/debug_widget_size.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  String nome;

  CarroPage(this.nome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
      ),
      body: DebugWidgetSize(),
    );
  }
}
