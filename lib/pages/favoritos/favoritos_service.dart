import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

class FavoritosService {

  CollectionReference get _users => fb.firestore().collection("users");

  Stream<List<Usuario>> get streamUsers => _users.onSnapshot.map((QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Usuario.fromMap(doc.data())).toList();
  });

  CollectionReference get _carros => fb.firestore().collection("carros");

  Stream<List<Carro>> get streamCarros => _carros.onSnapshot.map((QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Carro.fromMap(doc.data())).toList();
  });

}