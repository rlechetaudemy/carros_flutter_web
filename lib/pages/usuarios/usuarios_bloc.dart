import 'package:carros_flutter_web/imports.dart';

class UsuariosBloc extends SimpleBloc<List<Usuario>> {
  Future<List<Usuario>> fetch(context) async {
    try {
      List<Usuario> list = await UsuariosApi.getUsuarios(context);

      add(list);

      return list;
    } catch (e, ex) {
      print("Usuarios error $e > $ex");

      addError(e);
    }

    return [];
  }
}
