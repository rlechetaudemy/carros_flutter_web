import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/widgets/app_button.dart';
import 'package:carros_flutter_web/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EsqueciSenhaPage extends StatefulWidget {
  @override
  _EsqueciSenhaPageState createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  Size get size => MediaQuery.of(context).size;

  AppModel get app => AppModel.get(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout2(),
    );
  }

  _layout2() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "imgs/background.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Center(
          child: Container(
            width: 457,
            height: 400,
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
                      "Esqueci a Senha",
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

  _form() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child: AppTextField(
            label: "Login/Email",
            required: true,
          ),
        ),
        Row(
          children: <Widget>[
            Spacer(),
            AppButton(
              "Cancelar",
              onPressed: _onClickCancelar,
              whiteMode: true,
            ),
            SizedBox(
              width: 20,
            ),
            AppButton("Enviar", onPressed: _onClickEsqueciSenha),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }

  _field(String label, Widget textWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(label),
            Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        textWidget,
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _onClickCancelar() {
    pop(context);
  }

  _onClickEsqueciSenha() {
    alert(context,
        "Não implementado, mas se estivesse um link para recuperar a senha teria sido enviado para o seu email :-)",
        callback: () {
      pop(context);
    });
  }
}
