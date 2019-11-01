import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/carros/carro_id_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class App {
  static Router router;
}

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define("/", handler: GenericHandler(LoginPage()));
    router.define("/carros", handler: GenericHandler(CarrosPage()));
    router.define("/carros/:id",
        handler: carros, transitionType: TransitionType.fadeIn);
  }
}

class GenericHandler extends Handler {
  GenericHandler(Widget widget) : super(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print("route > $widget");
    return widget;
  });
}

var carros = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print("route carros > $params");
  String id = params["id"][0];
  return CarroIdPage(int.parse(id));
});
