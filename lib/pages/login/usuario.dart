import 'dart:convert' as convert;

import 'package:carros_flutter_web/pages/login/login_page.dart';
import 'package:carros_flutter_web/utils/nav.dart';
import 'package:carros_flutter_web/utils/web/prefs.dart';
import 'package:flutter/material.dart';

class Usuario {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  bool selected = false;

  String getTokenTest() {
    if (token != null) {
      return token.substring(0, 5);
    }
    return "";
  }

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    login = map['login'];
    nome = map['nome'];
    email = map['email'];
    urlFoto = map['urlFoto'];
    token = map['token'];
    roles = map['roles'] != null ? map['roles'].cast<String>() : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Prefs.setString("user.prefs", toJson());
  }

  static Future<Usuario> get() async {
    String json = Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromMap(map);
    return user;
  }

  String toJson() {
    Map map = toMap();
    String json = convert.json.encode(map);
    return json;
  }

  static logout(BuildContext context) {
    Usuario.clear();
    push(context, LoginPage(), replace: true);
//    push(context, LoginMobilePage(),replace:true);
//    Navigator.of(context).pushReplacementNamed("/login");
//    Navigator.of(context).pushReplacementNamed("/loginMobile");
  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, token: ${token.substring(0, 10)}';
  }
}
