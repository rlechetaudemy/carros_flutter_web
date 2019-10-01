import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/carros/carros_list.dart';

class CarrosPage extends StatefulWidget {
  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  Usuario get user => AppModel.get(context).user;

  @override
  Widget build(BuildContext context) {
    return user.isAdmin() ? _admin() : _user();
  }

  _user() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: CarrosListView(),
    );
  }

  _admin() {
    return Scaffold(
      body: BreadCrumb(
        child: CarrosListView(),
        actions: [
          AddButton(
            onPressed: _onClickAdd,
          )
        ],
      ),
    );
  }

  // Adicionar novo carro
  _onClickAdd() {
    PagesModel.get(context).push(PageInfo("Carros", CarroFormPage()));
  }
}
