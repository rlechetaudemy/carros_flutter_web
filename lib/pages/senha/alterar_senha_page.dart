import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/widgets/app_button.dart';
import 'package:carros_flutter_web/widgets/app_text_field.dart';
import 'package:carros_flutter_web/widgets/form_template.dart';
import 'package:flutter/material.dart';

class AlterarSenhaPage extends StatefulWidget {
  @override
  _AlterarSenhaPageState createState() => _AlterarSenhaPageState();
}

class _AlterarSenhaPageState extends State<AlterarSenhaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormTemplate(
        "Alterar Senha",
        _form(),
      ),
    );
  }

  _form() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTextField(
            label: "Senha Atual",
            width: 540,
            required: true,
            password: true,
          ),
          AppTextField(
            label: "Nova Senha",
            width: 540,
            required: true,
            password: true,
          ),
          AppTextField(
            label: "Confirmar senha",
            width: 540,
            required: true,
            password: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AppButton(
                "Cancelar",
                onPressed: _onClickCancelar,
                whiteMode: true,
              ),
              SizedBox(
                width: 20,
              ),
              AppButton("Alterar", onPressed: _onClickAlterarSenha),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  _onClickAlterarSenha() {
    alert(context, "Não implementado :-)");
  }

  _onClickCancelar() {
    PagesModel.get(context).pop();
  }
}
