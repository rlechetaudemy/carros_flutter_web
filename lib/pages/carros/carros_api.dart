import 'dart:convert' as convert;

import 'package:carros_flutter_web/constants.dart';
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:carros_flutter_web/utils/api_response.dart';
import 'package:carros_flutter_web/utils/http_helper.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(context, String tipo) async {
    String url = "$BASE_URL/carros";

    if (tipo != null) {
      url += "/tipo/$tipo";
    }

    print("GET > $url");

    final response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    String json = response.body;

    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse> save(Carro c) async {
    try {
      String url = "$BASE_URL/carros";

      String json = c.toJson();

      print("POST > $url");
      print("body: $json");

      final response = await http.post(url, body: json);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        Carro carro = Carro.fromMap(mapResponse);

        print("Carro salvo: ${carro.id}");

        return ApiResponse.ok();
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      print(e);

      return ApiResponse.error(msg: "Não foi possível salvar o carro");
    }
  }

  static Future<ApiResponse> delete(Carro c) async {
    try {
      String url = "$BASE_URL/carros/${c.id}";

      print("DELETE > $url");

      var response = await http.delete(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return ApiResponse.ok();
      }
    } catch (e) {
      print(e);
    }

    return ApiResponse.error(msg: "Não foi possível deletar o carro");
  }
}
