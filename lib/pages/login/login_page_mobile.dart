import 'package:carros_flutter_web/pages/login/login_form.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/senha/esqueci_senha_mobile_page.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:flutter/material.dart';

class LoginMobilePage extends StatefulWidget {
  @override
  _LoginMobilePageState createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> with LoginCallback {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: LoginForm(
          callback: this,
        ));
  }

  @override
  cadastrar() {
    alert(context, "Cadastrar");
  }

  @override
  esqueciSenha() {
    push(context, EsqueciSenhaMobilePage());
  }

  @override
  loginOk(Usuario user) {
    //push(context, HomeMobilePage(),replace: true);
  }
}
