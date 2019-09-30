import 'dart:async';

import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/usuarios/usuario_page.dart';
import 'package:carros_flutter_web/pages/usuarios/usuarios_bloc.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/web/breadcrumb.dart';
import 'package:carros_flutter_web/widgets/material_container.dart';
import 'package:carros_flutter_web/widgets/text_error.dart';
import 'package:flutter/material.dart';

class UsuariosListPage extends StatefulWidget {
  UsuariosListPage();

  @override
  _UsuariosListPageState createState() => _UsuariosListPageState();
}

class _UsuariosListPageState extends State<UsuariosListPage>
    with AutomaticKeepAliveClientMixin<UsuariosListPage> {
  final _bloc = UsuariosBloc();

  List<Usuario> usuarios;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BreadCrumb(
      child: _stream(),
    );
  }

  _stream() {
    return Card(
//    color: Colors.yellow[100],
      child: StreamBuilder(
        initialData: usuarios,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return TextError("Não foi possível buscar os usuários");
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          usuarios = snapshot.data;

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: PageView(
              children: <Widget>[
                _listView(usuarios),
              ],
            ),
          );
        },
      ),
    );
  }

  _listView(List<Usuario> usuarios) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.8),
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          Usuario u = usuarios[index];

          return OnTapContainer(
            child: _cardUser(u),
            onTap: () => _onClickUsuario(u),
          );
        },
      ),
    );
  }

  Card _cardUser(Usuario u) {
    return Card(
//      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                u.urlFoto ??
                    "https://image.shutterstock.com/image-vector/avatar-man-icon-profile-placeholder-260nw-1229859850.jpg",
                width: 100,
              ),
            ),
            Text(
              u.nome,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "descrição...",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  _onClickUsuario(Usuario u) {
    push(context, UsuarioPage(usuario:u));
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(context);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
