import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/main.dart';
import 'package:carros_flutter_web/pages/login/usuario.dart';
import 'package:carros_flutter_web/pages/usuarios/usuario_page.dart';
import 'package:carros_flutter_web/pages/usuarios/usuarios_bloc.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/web/breadcrumb.dart';
import 'package:carros_flutter_web/widgets/add_button.dart';
import 'package:carros_flutter_web/widgets/text_error.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  UsuariosPage();

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage>
    with AutomaticKeepAliveClientMixin<UsuariosPage> {
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

    return Container(
      child: BreadCrumb(
        child: _stream(),
        actions: [
          AddButton(
            "+ Novo",
            onPressed: _onClickAdd,
          )
        ],
      ),
    );
  }

  _stream() {
    return Card(
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

          return _dataTable(usuarios);
        },
      ),
    );
  }

  _dataTable(List<Usuario> usuarios) {
    return Container(
//      height: double.infinity,
      child: DataTable(
//        onSelectAll: (b) {},
        sortColumnIndex: 0,
        sortAscending: true,
        columns: _columns(),
        rows: _rows(usuarios),
      ),
    );
  }

  List<DataColumn> _columns() {
    return <DataColumn>[
      DataColumn(
        label: Text("Id"),
        numeric: true,
        onSort: (i, b) {
          setState(() {
            usuarios.sort((a, b) => a.id.compareTo(b.id));
          });
        },
        tooltip: "Id do Usuário",
      ),
      DataColumn(
        label: Text("Nome"),
        numeric: false,
        onSort: (i, b) {
          setState(() {
            usuarios.sort((a, b) => a.nome.compareTo(b.nome));
          });
        },
        tooltip: "Nome",
      ),
      DataColumn(
        label: Text("Login"),
        numeric: false,
        onSort: (i, b) {
          setState(() {
            usuarios.sort((a, b) => a.login.compareTo(b.login));
          });
        },
        tooltip: "Login",
      ),
      DataColumn(
        label: Text("Email"),
        numeric: false,
        onSort: (i, b) {
          setState(() {
            usuarios.sort((a, b) => a.email.compareTo(b.email));
          });
        },
        tooltip: "Email",
      ),
      DataColumn(
        label: Text("Perfil"),
        numeric: false,
        onSort: (i, b) {
          setState(() {
            usuarios.sort((a, b) => a.email.compareTo(b.email));
          });
        },
        tooltip: "Perfil",
      ),
      DataColumn(
        label: Text("Foto"),
        numeric: false,
        tooltip: "Foto",
      ),
    ];
  }

  List<DataRow> _rows(List<Usuario> usuarios) {
    return usuarios
        .map(
          (u) => DataRow(
            onSelectChanged: (bool selected) {
              if (selected) {
                _onClickUsuario(u);
              }
            },
            cells: [
              DataCell(
                Text("${u.id}"),
              ),
              DataCell(
                Text(u.nome),
              ),
              DataCell(
                Text(u.login),
              ),
              DataCell(
                Text(u.email),
              ),
              DataCell(
                Text("${u.roles}"),
              ),
              DataCell(
                Image.network(u.urlFoto),
              )
            ],
          ),
        )
        .toList();
  }

  _onClickUsuario(Usuario u) {
    if (mobile) {
      push(context, UsuarioPage(usuario:u));
    } else {
      PagesModel.get(context).push(PageInfo("Usuario ${u.nome}",UsuarioPage(usuario:u)) );
    }
  }

  _onClickAdd() {
    _onClickUsuario(null);
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
