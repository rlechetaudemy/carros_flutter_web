import 'package:carros_flutter_web/imports.dart';

class AppModel {
  //static Usuario getUsuario(context) => Provider.of<AppModel>(context,listen: false).user;

  static AppModel get(context, {bool listen = false}) =>
      Provider.of<AppModel>(context, listen: false);

  Usuario _user;

  Usuario get user => _user;

  void setUser(Usuario u) {
    this._user = u;
  }
}

class PageInfo {
  String title;
  Widget page;

  PageInfo(this.title, this.page);

  @override
  String toString() {
    return title;
  }
}

class PagesModel extends ChangeNotifier {
  static PagesModel get(context, {bool listen = false}) =>
      Provider.of<PagesModel>(context, listen: listen);

  List<PageInfo> pages = [];

  PageInfo defaultPage = PageInfo("Home", DefaultPage());

  PagesModel() {
    pages.add(defaultPage);
  }

  push(PageInfo page, {bool replace = false}) {
    if (replace) {
      popAll();
    }

    if (page.title != "Home") {
      this.pages.add(page);
    }

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }

  void popAll() {
    this.pages.clear();
    pages.add(defaultPage);

    notifyListeners();
  }

  void popTo(int index) {
    pages.removeRange(index + 1, pages.length);

    notifyListeners();
  }
}
