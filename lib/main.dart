import 'package:carros_flutter_web/imports.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

void main() {
  _initFirebase();

  runApp(MyApp());
}

_initFirebase() {
  initializeApp(
      apiKey: "AIzaSyBzGBV2okQ_as_jLgTh0BYK4YxXg5WDkE0",
      authDomain: "YourAuthDomain",
      databaseURL: "https://carros-f177d.firebaseio.com",
      projectId: "carros-f177d",
      storageBucket: "gs://carros-f177d.appspot.com");

  CollectionReference ref = fb.firestore().collection("carros");
  print(ref);

  ref.onSnapshot.listen((querySnapshot) {
    for (var change in querySnapshot.docChanges()) {
      var docSnapshot = change.doc;
      print(change.doc);
      print(change.type);
      print(docSnapshot.data());
    }
  });

//  Database db = database();
//  DatabaseReference ref = db.ref("messages");
//
//  ref.onValue.listen((e) {
//    DataSnapshot datasnapshot = e.snapshot;
//    // Do something with datasnapshot
//  });
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
