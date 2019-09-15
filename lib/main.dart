import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(
          builder: (context) => AppModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: HomePage(),
      ),
    );
  }

  _theme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.green,
      hoverColor: Colors.green[100],
      textTheme: TextTheme(
        body1: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
