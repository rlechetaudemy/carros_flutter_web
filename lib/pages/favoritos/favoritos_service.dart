import 'package:carros_flutter_web/imports.dart';
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

class FavoritosService {

  // Usuários
  CollectionReference get _users => fb.firestore().collection("users");

  Stream<List<DocumentSnapshot>> get streamUsers => _users.onSnapshot.map
    ((QuerySnapshot query) => query.docs.map((doc) => doc).toList());

  // Carros
  CollectionReference getCarros(String userId) => fb.firestore().collection("users").doc(userId).collection("carros");

  Stream<List<DocumentSnapshot>> getStreamCarros(String userId) => getCarros(userId).onSnapshot.map
    ((QuerySnapshot query) => query.docs.map((doc) => doc).toList());

}