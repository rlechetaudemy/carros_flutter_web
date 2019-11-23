import 'package:carros_flutter_web/pages/push/push_input.dart';
import 'package:carros_flutter_web/utils/alert.dart';
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
      appBar: AppBar(
        title: Text("Send Push"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Text(
              "Exemplo de enviar Push Notification usando o Firebase Messaging (FCM)",
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Titulo",
              ),
              onChanged: (String s) => _input.title = s,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Mensagem / body",
              ),
              onChanged: (String s) => _input.msg = s,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Firebase Token",
              ),
              onChanged: (String s) => _input.token = s,
            ),
            RaisedButton(
              child: Text("Send Push"),
              onPressed: _onClickPush,
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

    print("Login: ${_input.title}, senha: ${_input.msg}");

    final response = await PushApi.push(_input);

    alert(context, response.msg);
  }
}
