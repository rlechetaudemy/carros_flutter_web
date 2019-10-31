import 'package:carros_flutter_web/imports.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage({this.carro});

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  
  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    Carro c = ModalRoute.of(context).settings.arguments;
    if(c != null) {
      widget.carro = c;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () => _onClickMapa(context),
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () => _onClickVideo(context),
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          carro.urlFoto != null
              ? Image.network(carro.urlFoto)
              : FlutterLogo(
                  size: 100,
                )
        ],
      ),
    );
  }

  void _onClickMapa(context) {
    if (carro.latitude != null && carro.longitude != null) {
      launch(
          "https://www.google.com/maps/@${carro.latitude},${carro.longitude},19z");
    } else {
      alert(context, "Este carro não possui Lat/Lng da fábrica.");
    }
  }

  void _onClickVideo(context) {
    if (carro.urlVideo != null && carro.urlVideo.isNotEmpty) {
      launch(carro.urlVideo);
    } else {
      alert(context, "Este carro não possui nenhum vídeo");
    }
  }
}
