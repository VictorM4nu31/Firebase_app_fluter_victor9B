import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Regresa una lista de datos
Future<List> obtenerDatos() async {
  List gente = [];
  CollectionReference collectionReferenceGente = db.collection('001');

  QuerySnapshot queryGente = await collectionReferenceGente.get();
  queryGente.docs.forEach((documento) {
    var data = documento.data() as Map;
    data['id'] = documento.id; // Agrega el ID del documento
    gente.add(data);
  });

  await Future.delayed(const Duration(seconds: 2));
  return gente;
}

// Leer datos
Future<void> leerNombre(String nombre) async {
  await db.collection("001").add({"nombre": nombre});
}

// Actualizar nombre
Future<void> actualizarNombre(String id, String nombre) async {
  await db.collection("001").doc(id).update({"nombre": nombre});
}

// Eliminar nombre
Future<void> eliminarNombre(String id) async {
  await db.collection("001").doc(id).delete();
}
