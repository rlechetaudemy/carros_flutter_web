import 'dart:html' as html;

launch(String url) {
  html.window.open(url, "site");
}

back() {
  html.window.history.back();
}

forward() {
  html.window.history.forward();
}

share([Map data]) {
  html.window.navigator.share(data);
}
