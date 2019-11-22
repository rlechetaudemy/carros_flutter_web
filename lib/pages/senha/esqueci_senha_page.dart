import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/widgets/card_form.dart';

class EsqueciSenhaPage extends StatefulWidget {
  @override
  _EsqueciSenhaPageState createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255,92,107,128),
        width: size.width,
        height: size.height,
        child: CardForm(
          title: "Esqueci a Senha",
          child: _form(),
        ),
      ),
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
        CardForm(
          title: "Esqueci a Senha",
          child: _form(),
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

  _onClickCancelar() {
    pop(context);
  }

  _onClickEsqueciSenha() {
    alert(context, "Não implementado :-)", callback: () {
      pop(context);
    });
  }
}
