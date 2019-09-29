import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/home.dart';
import 'package:carros_flutter_web/pages/login/login_form.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/senha/esqueci_senha_page.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginCallback {
  Size get size => MediaQuery.of(context).size;

  AppModel get app => AppModel.get(context);

  @override
  void initState() {
    super.initState();

    _autoLogin();
  }

  void _autoLogin() {
    Usuario.get().then((Usuario u) {
      print("User logado $u");
      if (u != null) {
        AppModel.get(context).setUser(u);

        push(context, HomePage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _autoLogin();

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _layout2(),
    );
  }

  _layout2() {
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
            width: 457,
            height: 460,
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
                      style: TextStyle(color: Colors.white, fontSize: 22),
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

  _layout1() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Header
        Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.maxFinite,
              height: size.height / 2,
              child: Text("${size.width}/${size.height}"),
            ),
            Container(
              color: AppColors.blue,
              width: double.maxFinite,
              height: size.height / 2,
            )
          ],
        ),
        // Form / Card
        Center(
          child: Card(
            elevation: 4,
            child: Container(
              color: Colors.white,
              width: size.width * 0.5,
              height: size.height * 0.7,
              child: _form(),
            ),
          ),
        )
      ],
    );
  }

  _form() {
    return LoginForm(
      callback: this,
    );
  }

  @override
  cadastrar() {
    alert(context, "Cadastrar");
  }

  @override
  esqueciSenha() {
//    if(mobile) {
//      push(context, EsqueciSenhaMobilePage());
//    } else {
    push(context, EsqueciSenhaPage());
//    }
  }

  @override
  loginOk(Usuario user) {
    push(context, HomePage(), replace: true);
  }
}
