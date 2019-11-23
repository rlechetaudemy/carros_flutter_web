import 'package:carros_flutter_web/imports.dart';
import 'package:firebase/firebase.dart';

void main() {
  _initFirebase();

  runApp(MyApp());
}

_initFirebase() {
  initializeApp(
    apiKey: "AIzaSyD6eDBQ9PGsehPfwbaCK8NnrwIWa1Al6t0",
    projectId: "carros-flutterweb",
    databaseURL: "https://carros-flutterweb.firebaseio.com",);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AppModel(),
        ),
        ChangeNotifierProvider(
          builder: (context) => PagesModel(),
        )
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme(context),
      home: LoginPage(),
    );
  }

  _theme(context) {
    AppModel app = AppModel.get(context, listen: true);

    bool admin = app.user == null || app.user.isAdmin();

    return admin ? _themeAdmin() : _themeUser();
  }

  _themeUser() {
    return ThemeData(
      fontFamily: "Raleway",
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.blue[600],
      textTheme: TextTheme(
        body1: TextStyle(
          color: AppColors.blue,
          fontSize: 18,
        ),
      ),
    );
  }

  _themeAdmin() {
    return ThemeData(
      fontFamily: "Raleway",
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.blue[600],
      textTheme: TextTheme(
        body1: TextStyle(
          color: AppColors.blue,
          fontSize: 22,
        ),
      ),
    );
  }
}
