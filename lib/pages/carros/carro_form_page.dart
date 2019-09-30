import 'package:carros_flutter_web/imports.dart';

class CarroFormPage extends StatefulWidget {
  final Carro carro;

  CarroFormPage({this.carro}) : super();

  @override
  _CarroFormPageState createState() => _CarroFormPageState();
}

class _CarroFormPageState extends State<CarroFormPage> {
  // Url do upload
  String urlFoto;

  Carro get carro => widget.carro;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: "carro_form");

  var _showProgress = false;
  final tNome = TextEditingController();
  final tDesc = TextEditingController();
  final tTipo = TextEditingController();
  int _radioIndex = 0;

  bool uploading = false;

  final uploadHelper = UploadHelper();

  StreamSubscription<UploadState> subscription;

  @override
  void initState() {
    super.initState();

    // Stream de upload
    subscription = uploadHelper.stream.listen((UploadState state) {
      _setUploadState(state);
    });

    // Copia os dados do carro para o form
    if (carro != null) {
      tNome.text = carro.nome;
      tDesc.text = carro.descricao;
      _radioIndex = getTipoInt(carro);
    }
  }

  // Add validate email function.
  String _validateNome(String value) {
    if (value.isEmpty) {
      return 'Informe o nome do carro.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BreadCrumb(
      child: body(),
      actions: carro != null
          ? [
              DeleteButton(
                onPressed: _onClickDelete,
              )
            ]
          : null,
    );
  }

  body() {
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

  void _onClickTipo(int value) {
    setState(() {
      _radioIndex = value;
    });
  }

  getTipoInt(Carro carro) {
    switch (carro.tipo) {
      case "classicos":
        return 0;
      case "esportivos":
        return 1;
      default:
        return 2;
    }
  }

  String _getTipo() {
    switch (_radioIndex) {
      case 0:
        return "classicos";
      case 1:
        return "esportivos";
      default:
        return "luxo";
    }
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
                    uploading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : _foto(),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      uploading
                          ? "Aguarde o upload da foto..."
                          : "Clique na imagem para tirar uma foto",
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

  _foto() {
    String url = carro != null ? carro.urlFoto : null;
    if (urlFoto != null) {
      // Se tirou foto, fica com a foto nova
      url = urlFoto;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 250,
        maxHeight: 250,
      ),
      child: url != null
          ? Image.network(url)
          : Image.asset("assets/imgs/car_logo.png", color: AppColors.blue),
    );
  }

  _cardForm() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: this._formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Tipo",
//              textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 18,
                ),
              ),
              _radioTipo(),
              SizedBox(
                height: 10,
              ),
              AppTextField(
                label: "Nome",
                controller: tNome,
                required: true,
                validator: _validateNome,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              AppTextField(
                label: "Descrição",
                controller: tDesc,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
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
                    showProgress: _showProgress,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _radioTipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Clássicos",
          style: TextStyle(color: AppColors.blue, fontSize: 14),
        ),
        Radio(
          value: 1,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Esportivos",
          style: TextStyle(color: AppColors.blue, fontSize: 14),
        ),
        Radio(
          value: 2,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        Text(
          "Luxo",
          style: TextStyle(color: AppColors.blue, fontSize: 14),
        ),
      ],
    );
  }

  _onClickFoto() {
    uploadHelper.upload();
  }

  void _setUploadState(UploadState state) {
    if (state.started) {
      print("Upload iniciado...");
      setState(() {
        uploading = true;
      });
    } else {
      upload(state.fileUpload);
    }
  }

  upload(FileUpload file) async {
    ApiResponse<String> response =
        await UploadApi.upload(file.fileName, file.mimeType, file.base64);

    print("Ok ${response.ok}");
    print("Ok url ${response.result}");

    if (response.ok) {
      String url = response.result;
      print(url);
      setState(() {
        uploading = false;
        this.urlFoto = url;
      });
    }
  }

  _onClickSalvar() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    // Cria o carro
    var c = carro ?? Carro();
    c.nome = tNome.text;
    c.descricao = tDesc.text;
    c.tipo = _getTipo();

    if (urlFoto != null) {
      // Atualiza a URL de upload no carro
      c.urlFoto = urlFoto;
    }

    print("Carro: $c");

    setState(() {
      _showProgress = true;
    });

    print("Salvar o carro $c");

    ApiResponse response = await CarrosApi.save(context, c);

    if (response.ok) {
      alert(context, "Carro salvo com sucesso", callback: () {
//        EventBus.get(context).sendEvent(CarroEvent("carro_salvo",c.tipo));

        PagesModel.get(context).pop();
      });
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });

    print("Fim.");
  }

  _onClickCancelar() {
    PagesModel.get(context).pop();
  }

  void _onClickDelete() {
    // Alerta para confirmar
    alertConfirm(context, "Deseja mesmo excluir?", confirmCallback: delete);
  }

  delete() async {
    ApiResponse response = await CarrosApi.delete(context, carro);
    if (response.ok) {
      alert(context, response.msg, callback: () {
        PagesModel.get(context).pop();
      });
    } else {
      alert(context, response.msg);
    }
  }

  @override
  void dispose() {
    super.dispose();

    subscription.cancel();
    uploadHelper.dispose();
  }
}
