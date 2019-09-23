
import 'package:carros_flutter_web/pages/carros/carros_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  List<Widget> pages = [];

  AppModel() {
    pages.add(CarrosPage());
  }

  push(Widget page) {
    this.pages.add(page);

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }
}