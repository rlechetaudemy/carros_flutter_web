
import 'package:carros_flutter_web/pages/carros/carros_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {

  Widget page;

  AppModel() {
    page = CarrosPage();
  }

  setPage(Widget page) {
    this.page = page;

    notifyListeners();
  }
}