import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/carros/carro_id_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define("/", handler: login);
    router.define("/cars", handler: cars);
    router.define("/cars/:id", handler: car, transitionType: TransitionType.fadeIn);
  }
}

var login = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

var cars = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CarrosPage();
    });

var car = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CarroIdPage();
    });