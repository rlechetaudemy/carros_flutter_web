import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/login/login_bloc.dart';
import 'package:carros_flutter_web/pages/senha/esqueci_senha_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AppModel get app => AppModel.get(context);

  final _formKey = GlobalKey<FormState>();

  final _loginBloc = LoginBloc();

  final _loginInput = LoginInput();

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  bool checkManterLogado = false;

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 números";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          AppTextField(
            label: "Login",
            hint: "Digite o login",
            controller: _tLogin,
            validator: (s) => _validateLogin(s),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            nextFocus: _focusSenha,
            onChanged: (s) => _loginInput.login = s,
          ),
          SizedBox(height: 10),
          AppTextField(
            label: "Senha",
            hint: "Digite a senha",
            controller: _tSenha,
            password: true,
            validator: _validateSenha,
            keyboardType: TextInputType.number,
            focusNode: _focusSenha,
            onChanged: (s) => _loginInput.senha = s,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Manter logado",
                    style: TextStyle(color: AppColors.blue, fontSize: 14),
                  ),
                  StreamBuilder<bool>(
                    stream: _loginBloc.checkManterLogado.stream,
                    initialData: false,
                    builder: (context, snapshot) {
                      return Checkbox(
                        value: snapshot.data,
                        onChanged: (b) {
                          _loginBloc.checkManterLogado.add(b);
                          _loginInput.checkManterLogado = b;
                        },
                      );
                    },
                  ),
                ],
              ),
              InkWell(
                onTap: _onClickEsqueciSenha,
                child: Center(
                  child: Text(
                    "Esqueci a senha",
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: StreamBuilder<bool>(
              stream: _loginBloc.progress.stream,
              initialData: false,
              builder: (context, snapshot) {
                return AppButton(
                  "Login",
                  onPressed: _onClickLogin,
                  showProgress: snapshot.data,
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _onClickCadastrar,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Ainda não é cadastrado?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    "Crie uma conta",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _onClickHelp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Ajuda",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Icon(
                    Icons.help,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    print("Login: ${_loginInput.login}, Senha: ${_loginInput.senha}");

    ApiResponse<Usuario> response =
        await _loginBloc.login(context, _loginInput);

    if (response.ok) {
      Usuario user = response.result;

      if (user.isAdmin()) {
        push(context, HomePage(), replace: true);
      } else {
//        push(context, CarrosPage(), replace: true);
        Navigator.pushReplacementNamed(context, "/cars");
      }
    } else {
      alert(context, response.msg);
    }
  }

  void _onClickEsqueciSenha() {
    push(context, EsqueciSenhaPage());
  }

  void _onClickCadastrar() {
    alert(context, "Não implementado :-)");
  }

  void _onClickHelp() {
    alert(context, "Você pode se logar com os seguintes usuários:\n\n * admin/123 \n\n * user/123.");
  }

  @override
  void dispose() {
    super.dispose();

    _loginBloc.dispose();
  }
}
