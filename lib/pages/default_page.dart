import 'package:carros_flutter_web/web/debug_widget_size.dart';
import 'package:carros_flutter_web/utils/web/web_utils.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return DebugWidgetSize();
  }


}
