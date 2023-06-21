import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPersonas() async {
  List people = [];
  QuerySnapshot querySnapshot = await db.collection("Personas").get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "nombre": data["nombre"],
      "uid": doc.id,
    };

    people.add(person);
  }
  return people;
}

// Guardar un name en base de datos
Future<void> addPersona(name) async {
  await db.collection("Personas").add({"nombre": name});
}

Future<void> updatePersona(String uid, String name) async {
  // ignore: unnecessary_type_check
  if (uid is String) {
    await db.collection("Personas").doc(uid).update({
      "nombre": name,
    });
  } else {
    print("es nulo");
  }
}

Future<void> deletePersona(String uid) async {
  await db.collection("Personas").doc(uid).delete();
}
