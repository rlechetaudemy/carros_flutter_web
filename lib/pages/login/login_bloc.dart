import 'dart:async';

import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/pages/login/login_api.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/utils/api_response.dart';
import 'package:carros_flutter_web/utils/bloc.dart';

class LoginBloc {
  final checkManterLogado = BooleanBloc();
  final progress = BooleanBloc();

  Future<ApiResponse<Usuario>> login(
      context, String login, String senha) async {
    progress.set(true);

    ApiResponse<Usuario> response = await LoginApi.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;
      user.save();

      print("User API $user");

      // Salva no app model
      AppModel app = AppModel.get(context);
      app.setUser(user);
    }

//    ApiResponse<Usuario> response = ApiResponse.ok(null);

    progress.set(false);

    return response;
  }

  void dispose() {
    progress.dispose();
    checkManterLogado.dispose();
  }
}
