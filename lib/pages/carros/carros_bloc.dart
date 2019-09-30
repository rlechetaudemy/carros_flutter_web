import 'package:carros_flutter_web/imports.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  static Map<String, List<Carro>> cache = {};

  Future<List<Carro>> fetch(context, String tipo) async {
    try {
      String key = tipo ?? "todos";

      List<Carro> fromCache; //cache[key];

      List<Carro> carros =
          fromCache ?? await CarrosApi.getCarros(context, tipo);

      add(carros);

      cache[key] = carros;

      return carros;
    } catch (e, ex) {
      print("Carros error $e > $ex");
      addError(e);
    }
    return [];
  }
}
