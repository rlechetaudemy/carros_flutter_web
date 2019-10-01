import 'package:carros_flutter_web/imports.dart';

class CarrosListView extends StatefulWidget {
  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView> {

  final _bloc = CarrosBloc();

  List<Carro> carros;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
    );
  }

  int _columns(constraints) {
    int columns = constraints.maxWidth > 800 ? 3 : 2;
    if (constraints.maxWidth <= 500) {
      columns = 1;
    }
    return columns;
  }

  _grid(List<Carro> carros) {
    return LayoutBuilder(builder: (context, constraints) {
      int columns = _columns(constraints);

      return Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: 1.8,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return StackMaterialContainer(
              child: _cardCarro(c),
              onTap: () => _onClickCarro(c),
            );
          },
        ),
      );
    });
  }

  _cardCarro(Carro c) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          child: Container(
//        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                Center(
                  child: Text(
                    "${c.nome}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: fontSize(constraints.maxWidth * 0.05)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _onClickCarro(Carro c) {
    if (mobile) {
      push(context, CarroPage(c));
    } else {
      PagesModel nav = PagesModel.get(context);
      nav.push(PageInfo("Carros", CarroFormPage(carro: c)));
    }
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(context);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
