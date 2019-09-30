

import 'package:carros_flutter_web/imports.dart';

bool mobile = false;

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
        home: LoginPage(),
      ),
    );
  }

  _theme() {
    return ThemeData(
      fontFamily: "Raleway",
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.blue[600],
      hoverColor: Colors.blue[50],
      textTheme: TextTheme(
        body1: TextStyle(
          color: AppColors.blue,
          fontSize: 22,
        ),
      ),
    );
  }
}
