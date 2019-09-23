
import 'package:carros_flutter_web/pages/carros/carros_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  List<Widget> pages = [];

  AppModel() {
    pages.add(CarrosPage());
  }

  push(Widget page, {bool replace = false}) {
    if(replace) {
      this.pages.clear();
    }

    this.pages.add(page);

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }
}