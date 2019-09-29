import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/domain/user.dart';
import 'package:carros_flutter_web/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool mobile = false;

Usuario user;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppModel>(
          builder: (context) => AppModel(),
        ),
        ChangeNotifierProvider(
          builder: (context) => PagesModel(),
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
      fontFamily: "Raleway",
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.blue,
      hoverColor: Colors.blue[100],
      textTheme: TextTheme(
        body1: TextStyle(
          color: AppColors.blue,
          fontSize: 22,
        ),
      ),
    );
  }
}
