
import 'package:carros_flutter_web/pages/carros_page.dart';
import 'package:carros_flutter_web/pages/default_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  List<Widget> _pages = [];

  Widget defaultPage = DefaultPage();

  AppModel() {
    _pages.add(defaultPage);
  }

  Widget get lastPage => _pages.last;

  List<Widget> get pages => _pages;

  push(Widget page, {bool replace = false}) {
    if(replace) {
      this._pages.clear();

      this._pages.add(defaultPage);
    }

    if(page.runtimeType != defaultPage.runtimeType) {
      _pages.add(page);
    }

    notifyListeners();
  }

  void pop() {
    _pages.removeLast();

    notifyListeners();
  }
}