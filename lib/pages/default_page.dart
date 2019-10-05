import 'package:carros_flutter_web/imports.dart';

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
    return Center(
      child: Container(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Carros",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/imgs/background.jpg",
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
