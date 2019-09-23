
import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/web/debug_widget_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarroPage extends StatelessWidget {
  String nome;

  CarroPage(this.nome);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(nome),
        RaisedButton(
          child: Text("Voltar"),
          onPressed: () {
            AppModel app = Provider.of<AppModel>(context, listen: false);
            app.pop();
          },
        )
      ],
    );
  }
}
