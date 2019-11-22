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
        push(context, CarrosPage(), replace: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255,92,107,128),
        width: size.width,
        height: size.height,
        child: CardForm(
          title: "Carros",
          child: LoginForm(),
        ),
      ),
    );
  }
}
