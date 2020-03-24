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
      resizeToAvoidBottomPadding: true,
      body: _layoutBackgroundImg(),
    );
  }

  _layoutBackgroundImg() {

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/imgs/background.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Center(
          child: Container(
            width: 460,
            height: 500,
            decoration: BoxDecoration(
                color: AppColors.cinza_background,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.cinza_606060,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: 76,
                  child: Center(
                    child: Text(
                      "Carros",
                      style: TextStyle(color: Colors.white,fontSize: 22),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: _form(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _form() {
    return  LoginForm();
  }
}
