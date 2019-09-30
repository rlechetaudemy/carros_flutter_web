import 'dart:async';

import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/usuarios/usuarios_api.dart';
import 'package:carros_flutter_web/utils/bloc.dart';

class UsuariosBloc extends SimpleBloc<List<Usuario>>{

  Future<List<Usuario>> fetch(context) async {
    try {

      List<Usuario> list = await UsuariosApi.getUsuarios(context);

      add(list);

      return list;
    } catch (e, ex) {
      print("Usuarios error $e > $ex");

      addError(e);
    }
  }
}