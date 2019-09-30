
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
    return SizedBox.expand(
      child: Image.asset(
        "assets/imgs/background.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
