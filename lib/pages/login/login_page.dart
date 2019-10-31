import 'package:carros_flutter_web/imports.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size get size => MediaQuery.of(context).size;

  AppModel get app => AppModel.get(context);

  @override
  void initState() {
    super.initState();

    // Login automático
    _autoLogin();
  }

  void _autoLogin() async {
    // Lê do storage
    Usuario user = await Usuario.get();
    if (user != null) {
      // Salva no Provider
      AppModel.get(context).setUser(user);

      if (user.isAdmin()) {
        push(context, HomePage(), replace: true);
      } else {
        Navigator.pushReplacementNamed(context, "/cars");
        //push(context, CarrosPage(), replace: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/imgs/background.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          CardForm(
            title: "Carros",
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}
