
import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/usuarios/usuarios_api.dart';
import 'package:carros_flutter_web/pages/usuarios/usuarios_datatable_page.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/utils/api_response.dart';
import 'package:carros_flutter_web/web/breadcrumb.dart';
import 'package:carros_flutter_web/widgets/app_button.dart';
import 'package:carros_flutter_web/widgets/app_text.dart';
import 'package:carros_flutter_web/widgets/app_text_field.dart';
import 'package:carros_flutter_web/widgets/delete_button.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  Usuario usuario;

  UsuarioPage({this.usuario});

  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  Color color = Colors.grey;

  bool _showProgress = false;

  Usuario get usuario => widget.usuario;

  final tNome = TextEditingController();
  final tLogin = TextEditingController();
  final tEmail = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (usuario != null) {
      tNome.text = usuario.nome;
      tLogin.text = usuario.login;
      tEmail.text = usuario.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreadCrumb(
        child: _body(),
        actions: usuario != null
            ? [
                DeleteButton(
                  onPressed: _onClickDelete,
                )
              ]
            : null,
      ),
    );
  }

  _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _cardFoto(),
        ),
        SizedBox(
          width: 28,
        ),
        Expanded(
          flex: 2,
          child: _cardForm(),
        )
      ],
    );
  }

  _cardFoto() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
//        width: 350,
        height: 320,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              InkWell(
                onTap: _onClickFoto,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 240, maxHeight: 200),
                      child: usuario != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(usuario.urlFoto),
                            )
                          : Image.asset("imgs/user_logo.png"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Clique na imagem para tirar uma foto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cardForm() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _form(),
          ],
        ),
      ),
    );
  }

  Form _form() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTextField(
            label: "Nome",
            controller: tNome,
            width: 540,
            required: true,
          ),
          SizedBox(
            height: 20,
          ),
          AppTextField(
            label: "Login",
            controller: tLogin,
            width: 540,
            required: true,
          ),
          SizedBox(
            height: 20,
          ),
          AppTextField(
            label: "Email",
            controller: tEmail,
            width: 540,
            required: true,
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
              AppButton(
                "Salvar",
                onPressed: _onClickSalvar,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

  _onClickCancelar() {
    PagesModel.get(context).pop();
  }

  _onClickSalvar() {
    String nome = tNome.text;
    String login = tLogin.text;
    String email = tEmail.text;

    print("Salvar nome: $nome, login: $login, email: $email");
  }

  void _onClickFoto() {}

  void _onClickDelete() {
    // Alerta para confirmar
    alertConfirm(context, "Deseja mesmo excluir?", confirmCallback: delete);
  }

  delete() async {
    ApiResponse response = await UsuariosApi.delete(context, usuario);
    if (response.ok) {
      alert(context, response.msg, callback: () {
        PagesModel.get(context).pop();
      });
    } else {
      alert(context, response.msg);
    }
  }
}
