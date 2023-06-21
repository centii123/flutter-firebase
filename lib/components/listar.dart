import 'package:firebase/services/firebaseService.dart';
import 'package:firebase/variables/variablesGlobales.dart';
import 'package:flutter/material.dart';

class lista extends StatefulWidget {
  const lista({super.key});

  @override
  State<lista> createState() => _listaState();
}

class _listaState extends State<lista> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPersonas(),
        builder: ((context, personasLista) {
          if (personasLista.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: personasLista.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    onDismissed: (direction) async {
                      await deletePersona(personasLista.data?[index]['uid']);
                      personasLista.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  "¿Está seguro de querer eliminar a ${personasLista.data?[index]['nombre']}?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(
                                        context,
                                        false,
                                      );
                                    },
                                    child: const Text("Cancelar",
                                        style: TextStyle(color: Colors.red))),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(
                                        context,
                                        true,
                                      );
                                    },
                                    child: const Text("Si, estoy seguro"))
                              ],
                            );
                          });

                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete_forever),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(personasLista.data?[index]['uid']),
                    child: ListTile(
                      leading:
                          Icon(Icons.person), // Icono en la parte izquierda
                      title: Text(personasLista.data?[index]
                          ["nombre"]), // Título del elemento
                      subtitle: Text(
                          'john.doe@example.com'), // Subtítulo del elemento
                      // Icono en la parte derecha
                      onTap: () async {
                          await Navigator.pushNamed(context, '/edit',
                              arguments: {
                                'name': personasLista.data?[index]['nombre'],
                                'uid': personasLista.data?[index]['uid'],
                              });
                          setState(() {});
                        },
                    ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}

/*Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete_forever),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key("1"),
                  child: ListTile(
                    leading: Icon(Icons.person), // Icono en la parte izquierda
                    title: Text(personasLista.data?[index]["nombre"]), // Título del elemento
                    subtitle:
                        Text('john.doe@example.com'), // Subtítulo del elemento
                    // Icono en la parte derecha
                    onTap: () {
                      // Acción a realizar cuando se toca el elemento
                      print('Tocado John Doe');
                    },
                  ),
                ) */







