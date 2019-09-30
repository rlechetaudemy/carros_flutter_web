import 'dart:async';
import 'package:flutter/services.dart';

class LoripsumBloc {
  static String lorim;

  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  fetch() async {
    String s = lorim ?? await LoripsumApi.getLoripsum();

    lorim = s;

    _streamController.add(s);
  }

  void dispose() {
    _streamController.close();
  }
}

class LoripsumApi {
  static Future<String> getLoripsum() async {
    String text = await rootBundle.loadString("json/loripsum.text");

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}
