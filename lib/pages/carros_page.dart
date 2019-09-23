
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:carros_flutter_web/pages/carros/carros_api.dart';
import 'package:carros_flutter_web/web/web_utils.dart';
import 'package:flutter/material.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Carro>>(
        future: CarrosApi.getCarros(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }

          List<Carro> carros = snapshot.data;

          return _listView(carros);
        },
      ),
    );
  }

  _listView(List<Carro> carros) {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = size(
              constraints.maxWidth * 0.07,
              min: 8,
              max: Theme.of(context).textTheme.body1.fontSize,
            );

            Carro carro = carros[index];

            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                      carro.urlFoto ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                  Text(
                    carro.nome ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: fontSize),
                  )
                ],
              ),
            );
          },
        );
        ;
      },
    );
  }
}
