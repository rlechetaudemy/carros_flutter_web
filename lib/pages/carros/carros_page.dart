import 'package:carros_flutter_web/imports.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;

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

  @override
  void initState() {
    super.initState();

    _bloc.fetch(context, tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BreadCrumb(
      child: _stream(),
      actions: [
        AddButton(
          onPressed: _onClickAdd,
        )
      ],
    );
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
                    style: TextStyle(fontSize: fontSize(constraints.maxWidth * 0.05)),
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
//      nav.push(PageInfo(item.title, item.page), replace: true);
      nav.push(PageInfo("Carros", CarroFormPage(carro: c)));
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
