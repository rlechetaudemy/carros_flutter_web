import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {

  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
              carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
          Text(
            carro.nome ?? "",
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
