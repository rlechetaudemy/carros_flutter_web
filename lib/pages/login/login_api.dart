import 'dart:convert';

import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/utils/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';
//      var url = 'http://livrowebservices.com.br/rest/login';

      Map<String, String> headers = {"Content-Type": "application/json"};
      Map params = {"username": login, "password": senha};
//      Map params = {
//        "login": login,
//        "senha": senha
//      };

      String s = json.encode(params);
      print(url);
      print(">> $s");

      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromMap(mapResponse);
        print(user);
        print(user.isAdmin());
        print("#--#");

        return ApiResponse.ok(result: user);
      }

      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error(msg: "Não foi possível fazer o login.");
    }
  }
}
