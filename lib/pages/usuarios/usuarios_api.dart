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
}
