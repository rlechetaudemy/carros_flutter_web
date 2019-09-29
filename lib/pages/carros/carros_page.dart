import 'dart:async';

import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/main.dart';
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:carros_flutter_web/pages/carros/carro_form_page.dart';
import 'package:carros_flutter_web/pages/carros/carro_page.dart';
import 'package:carros_flutter_web/pages/carros/carros_bloc.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/widgets/material_container.dart';
import 'package:carros_flutter_web/widgets/text_error.dart';
import 'package:flutter/material.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage({this.tipo});

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  Size get size => MediaQuery.of(context).size;

  List<Carro> carros;

  String get tipo => widget.tipo;

  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  _fontSize() {
    if (mobile) {
      return 22;
    }

    if (size.width > 1200) {
      return 22;
    } else if (size.width < 800) {
      return 10;
    }
    return 14;
  }

  @override
  void initState() {
    super.initState();

    _bloc.fetch(context, tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _stream();

//    return Breadcrumb(
//      context,
//      child: _stream(),
//      actions: [
//        IconButton(
//          icon: Icon(Icons.add),
//          onPressed: _onClickAdd,
//        )
//      ],
//    );
  }

  _stream() {
    return Scaffold(
      body: StreamBuilder(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError("Não foi possível buscar os carros");
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Carro> carros = snapshot.data;

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: _grid(carros),
          );
        },
      ),
    );
  }

  _grid(List<Carro> carros) {
    int columns = size.width > 1200 ? 3 : 2;
    if (mobile) {
      columns = 1;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns, childAspectRatio: 1.8),
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return MaterialContainer(
            child: _cardCarro(c, columns),
            onPressed: () => _onClickCarro(c),
          );
        },
      ),
    );
  }

  _cardCarro(Carro c, int columns) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 240,
                  maxHeight: 120,
                ),
                child: Image.network(
                  c.urlFoto ??
                      "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            columns == 3
                ? Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: _fontSize()),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  _onClickCarro(Carro c) {
    if (mobile) {
      push(context, CarroPage(c));
    } else {
      PagesModel nav = PagesModel.get(context);
//      nav.push(PageInfo(item.title, item.page), replace: true);
      nav.push(PageInfo("Carros", CarroFormPage(c)));
    }
  }

  _onClickAdd() {
    _onClickCarro(null);
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(context, tipo);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
