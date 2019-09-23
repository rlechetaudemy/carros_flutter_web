
import 'package:carros_flutter_web/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AppModel app = Provider.of<AppModel>(context);

    return app.page;
  }
}
