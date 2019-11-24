import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/push/push_input.dart';
import 'package:carros_flutter_web/utils/alert.dart';
import 'package:carros_flutter_web/web/breadcrumb.dart';
import 'package:flutter/material.dart';

class PushPage extends StatefulWidget {
  PushPage();

  @override
  _PushPageState createState() => _PushPageState();
}

class _PushPageState extends State<PushPage> {
  final _formKey = GlobalKey<FormState>();

  final _input = PushInput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreadCrumb(child: _body()),
    );
  }

  // Add validate email function.
  String _validateRequired(String value, String msg) {
    if (value.isEmpty) {
      return msg;
    }

    return null;
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Exemplo de enviar Push Notification usando o Firebase Messaging (FCM)",
              ),
            ),
            SizedBox(height: 26),
            AppTextField(
              label:
                  "Server Key (Console do Firebase > Project Settings > Cloud Messaging > Server Key)",
              onChanged: (String s) => _input.key = s,
              validator: (String s) =>
                  _validateRequired(s, "Informe a chave do Firebase"),
            ),
            AppTextField(
              label: "Titulo",
              onChanged: (String s) => _input.title = s,
              validator: (String s) => _validateRequired(s, "Informe o título"),
            ),
            AppTextField(
              label: "Mensagem / body",
              onChanged: (String s) => _input.msg = s,
              validator: (String s) =>
                  _validateRequired(s, "Informe a mensagem"),
            ),
            AppTextField(
              label: "Firebase Token (token do celular)",
              onChanged: (String s) => _input.token = s,
              validator: (String s) =>
                  _validateRequired(s, "Informe a mensagem"),
            ),
            Center(
              child: AppButton(
                "Enviar Push",
                onPressed: _onClickPush,
              ),
            )
          ],
        ),
      ),
    );
  }

  _onClickPush() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    print("> $_input");

    final response = await PushApi.push(_input);

    alert(context, response.msg);
  }
}
