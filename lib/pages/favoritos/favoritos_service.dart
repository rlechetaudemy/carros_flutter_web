import 'package:carros_flutter_web/imports.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';

class FavoritosService {

  // Collection de usuários
  CollectionReference get _users => fb.firestore().collection("users");

  // Cria a Stream de documentos para usuários
  Stream<List<DocumentSnapshot>> get streamUsers => _users.onSnapshot.map
    ((QuerySnapshot query) => query.docs.map((DocumentSnapshot doc) => doc).toList());

  // Collection de carros do usuário
  CollectionReference getCarros(String userId) => fb.firestore().collection("users").doc(userId).collection("carros");

  // Cria a Stream de documentos para carros
  Stream<List<DocumentSnapshot>> getStreamCarros(String userId) => getCarros(userId).onSnapshot.map
    ((QuerySnapshot query) => query.docs.map((DocumentSnapshot doc) => doc).toList());

}