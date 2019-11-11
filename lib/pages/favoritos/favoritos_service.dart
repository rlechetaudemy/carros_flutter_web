
import 'package:carros_flutter_web/pages/carros/carro.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:flutter/src/widgets/async.dart';

class FavoritosService {
  getCarros() => _carros.onSnapshot;

  CollectionReference get _carros => fb.firestore().collection("carros");

  Stream<List<Carro>> get stream => _carros.onSnapshot.map((QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) => Carro.fromMap(doc.data())).toList();
  });
}