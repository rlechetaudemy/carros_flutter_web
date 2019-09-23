
import 'package:carros_flutter_web/pages/carros/carros_page.dart';
import 'package:carros_flutter_web/pages/default_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  List<Widget> pages = [];

  Widget defaultPage = DefaultPage();

  AppModel() {
    pages.add(defaultPage);
  }

  push(Widget page, {bool replace = false}) {
    if(replace) {
      this.pages.clear();

      pages.add(defaultPage);
    }

    if(page.runtimeType.toString() != defaultPage.runtimeType.toString()) {
      this.pages.add(page);
    }

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }
}