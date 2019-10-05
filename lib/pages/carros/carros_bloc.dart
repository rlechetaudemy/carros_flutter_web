import 'package:carros_flutter_web/imports.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(context) async {
    try {

      List<Carro> carros = await CarrosApi.getCarros(context);

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }

    return [];
  }
}
