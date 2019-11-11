import 'package:carros_flutter_web/imports.dart';
import 'package:firebase/firestore.dart';

import 'favoritos_service.dart';

// Usuarios que favoritaram os carros pelo Firebase
// Vai ler a collection /users do Firestore
class UsuariosFavoritosPage extends StatefulWidget {
  @override
  _UsuariosFavoritosPageState createState() => _UsuariosFavoritosPageState();
}

class _UsuariosFavoritosPageState extends State<UsuariosFavoritosPage> {

  final _firebaseService = FavoritosService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BreadCrumb(
      child: StreamBuilder(
        stream: _firebaseService.streamUsers2,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError("Não foi possível buscar os usuários");
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> docs = snapshot.data;

          return _grid(docs);
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

  _grid(List<DocumentSnapshot> docs) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
            itemCount: docs.length,
            itemBuilder: (context, index) {

              // Firestore
              DocumentSnapshot doc = docs[index];

              Usuario user = Usuario.fromMap(doc.data());

              return StackMaterialContainer(
                child: _cardUsuario(user),
                onTap: () => _onClickUsuario(user, doc.id),
              );
            },
          ),
        );
      },
    );
  }

  _cardUsuario(Usuario c) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double font = constraints.maxWidth * 0.05;

        return Card(
          child: Container(
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
                    child: c.urlFoto != null
                        ? Image.network(
                            c.urlFoto,
                            fit: BoxFit.cover,
                          )
                        : FlutterLogo(
                            size: 100,
                          ),
                  ),
                ),
                Center(
                  child: text(
                    c.nome ?? "",
                    fontSize: fontSize(font),
                    maxLines: 1,
                    ellipsis: true,
                  ),
                ),
                Center(
                  child: text(
                    c.login ?? "",
                    fontSize: fontSize(font),
                    maxLines: 1,
                    ellipsis: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onClickUsuario(Usuario u, String docId) {
    print("user $u");
    print("doc id: $docId");
//    PagesModel nav = PagesModel.get(context);
//    nav.push(PageInfo(c.nome, CarrosFavoritosPage()));
  }

}
