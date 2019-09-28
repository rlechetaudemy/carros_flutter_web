import 'package:key_value_store_web/key_value_store_web.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;

class Prefs {
  static WebKeyValueStore get prefs =>
      WebKeyValueStore(html.window.localStorage);

  static void setBool(String key, bool b) {
    prefs.setBool(key, b);
  }

  static void setInt(String key, int i) {
    prefs.setInt(key, i);
  }

  static void setString(String key, String s) {
    prefs.setString(key, s);
  }

  static bool getBool(String key) {
    String s = prefs.getString(key);
    if (s != null) {
      return s == "true";
    }
    return false;
  }

  static int getInt(String key) {
    String s = prefs.getString(key);
    if (s != null) {
      return int.parse(s);
    }
    return 0;
  }

  static String getString(String key) {
    return prefs.getString(key) ?? "";
  }
}
