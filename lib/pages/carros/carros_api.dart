import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:carros_flutter_web/pages/carros/carro.dart';

class CarrosApi {

  static Future<List<Carro>> getCarros(context) async {
    String url = "https://carros-springboot.herokuapp.com/api/v1/carros";

    print("GET > $url");

    final response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    String json = response.body;

    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }
}
