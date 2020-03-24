import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context,
        FadeRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  return Navigator.push(context, FadeRoute(builder: (BuildContext context) {
    return page;
  }));
}

bool pop<T extends Object>(BuildContext context, [T result]) {
  if(Navigator.canPop(context)) {
    Navigator.pop(context);
    return true;
  }
  return false;
}

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    if (settings.isInitialRoute) {
//      return child;
//    }
    return FadeTransition(opacity: animation, child: child);
  }
}
