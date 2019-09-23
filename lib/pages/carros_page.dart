
import 'package:carros_flutter_web/pages/carro_page.dart';
import 'package:carros_flutter_web/utils/nav.dart';
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
      body: _body(),
    );
  }

  _body() {
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

            return InkWell(
              onTap: () => _onClickCarro(index),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: 250
                      ),
                      child: Container(
                        color: Colors.blue[50],
                        child: Image.network(
                            "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                      ),
                    ),
                    Text(
                      ">> Carro $index",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: fontSize),
                    )
                  ],
                ),
              ),
            );
          },
        );
        ;
      },
    );
  }

  _onClickCarro(int index) {
    push(context, CarroPage("Carro $index"));
  }
}
