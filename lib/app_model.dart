
import 'package:carros_flutter_web/pages/carros_page.dart';
import 'package:carros_flutter_web/pages/default_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  List<Widget> _pages = [];

  AppModel() {
    _pages.add(CarrosPage());
  }

  Widget get lastPage => _pages.last;

  push(Widget page) {
    this._pages.add(page);

    notifyListeners();
  }

  void pop() {
    _pages.removeLast();

    notifyListeners();
  }
}