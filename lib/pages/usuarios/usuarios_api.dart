import 'dart:convert' as convert;

import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/utils/http_helper.dart' as http;

class UsuariosApi {
  static const BASE_URL =
      'https://carros-springboot.herokuapp.com/api/v2/users';

  static Future<List<Usuario>> getUsuarios(context) async {
    String url = BASE_URL;
    print("GET > $url");

    var response = await http.get(context, url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    String json = response.body;

    List list = convert.json.decode(json);

    List<Usuario> carros =
        list.map<Usuario>((map) => Usuario.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse> save(context, Usuario u) async {
    try {
      String url = BASE_URL;
      print("POST > $url");

      String json = u.toJson();

      print("   JSON > $json");

      var response = await http.post(context, url, body: json);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        Usuario user = Usuario.fromMap(mapResponse);

        print("Novo usuario: ${user.id}");

        return ApiResponse.ok();
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      print(e);

      return ApiResponse.error(msg: "Não foi possível salvar o carro");
    }
  }

  static Future<ApiResponse> delete(context, Usuario u) async {
    try {
      String url = '$BASE_URL/${u.id}';
      print("DELETE > $url");

      var response = await http.delete(context, url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return ApiResponse.ok();
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      print(e);
    }

    return ApiResponse.error(msg: "Não foi possível deletar o usuário");
  }
}
