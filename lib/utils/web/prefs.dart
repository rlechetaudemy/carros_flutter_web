import 'package:universal_html/prefer_sdk/html.dart' as html;

import 'package:key_value_store_web/key_value_store_web.dart';

class Prefs {

  static WebKeyValueStore get prefs => WebKeyValueStore(html.window.localStorage);

  static bool getBool(String key) {
    String s = prefs.getString(key);
    if(s != null) {
      return s == "true";
    }
    return false;
  }

  static void setBool(String key, bool b) {
    prefs.setBool(key, b);
  }

  static int getInt(String key) {
    String s = prefs.getString(key);
    if(s != null) {
      return int.parse(s);
    }
    return 0;
  }

  static void setInt(String key, int i) {
    prefs.setInt(key, i);
  }

  static String getString(String key) {
    return prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) {
    prefs.setString(key, s);
  }
}