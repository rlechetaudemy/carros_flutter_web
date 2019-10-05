import 'package:carros_flutter_web/imports.dart';

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
