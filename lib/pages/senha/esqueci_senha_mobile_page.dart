import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/widgets/app_button.dart';
import 'package:carros_flutter_web/widgets/textfield_box.dart';
import 'package:flutter/material.dart';

class EsqueciSenhaMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Esqueci Senha",
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("E-mail*"),
            SizedBox(
              height: 10,
            ),
            TextFieldBox("email"),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                AppButton(
                  "Cancelar",
                  onPressed: () => _onClickCancelar(context),
                  whiteMode: true,
                ),
                SizedBox(
                  width: 20,
                ),
                AppButton(
                  "Enviar",
                  onPressed: () => _onClickEsqueciSenha(context),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onClickEsqueciSenha(BuildContext context) {
    alert(context, "Esqueci Senha, a fazer!", callback: () {
      pop(context);
    });
  }

  _onClickCancelar(BuildContext context) {
    pop(context);
  }
}
