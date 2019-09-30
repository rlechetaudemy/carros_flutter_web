import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/home.dart';
import 'package:carros_flutter_web/pages/login/login_form.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size get size => MediaQuery.of(context).size;

  bool get mobile => MediaQuery.of(context).size.width <= 500;

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
      body: Stack(
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  _title(),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: _form(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _form() {
    return LoginForm();
  }

  _title() {
    if(mobile) {
      return
        Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              "Carros",
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.cinza_606060,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: 76,
        child: Center(
          child: Text(
            "Carros ${size.width}/${size.height}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      );
    }
  }
}
