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
            return ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: personasLista.data!.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
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
                      tileColor: Color.fromARGB(255, 20, 20, 20),
                      leading:
                          Icon(Icons.person, color: Colors.white,), // Icono en la parte izquierda
                      title: Text(personasLista.data?[index]
                          ["nombre"], style: TextStyle(color: Colors.white),), // Título del elemento
                      /*subtitle: Text(
                          'john.doe@example.com'),*/ // Subtítulo del elemento
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



/*import 'package:firebase/services/firebaseService.dart';
import 'package:firebase/variables/variablesGlobales.dart';
import 'package:flutter/material.dart';

class lista extends StatefulWidget {
  const lista({super.key});

  @override
  State<lista> createState() => _listaState();
}

class _listaState extends State<lista> {
  late List<dynamic> personasLista;

  @override
  void initState() {
    super.initState();
    getPersonas().then((lista) {
      setState(() {
        personasLista = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (personasLista == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: personasLista.length,
        itemBuilder: (context, index) {
          return Dismissible(
              onDismissed: (direction) async {
                await deletePersona(personasLista[index]['uid']);
                personasLista.removeAt(index);
              },
              confirmDismiss: (direction) async {
                bool result = false;
                result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            "¿Está seguro de querer eliminar a ${personasLista[index]['nombre']}?"),
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
              key: Key(personasLista[index]['uid']),
              child: ListTile(
                leading: Icon(Icons.person), // Icono en la parte izquierda
                title: Text(personasLista[index]
                    ["nombre"]), // Título del elemento
                subtitle:
                    Text('john.doe@example.com'), // Subtítulo del elemento
                // Icono en la parte derecha
                onTap: () async {
                  await Navigator.pushNamed(context, '/edit', arguments: {
                    'name': personasLista[index]['nombre'],
                    'uid': personasLista[index]['uid'],
                  });
                  setState(() {});
                },
              ));
        },
      );
    }
  }
}*/

/*

if (personasLista) {
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
                leading: Icon(Icons.person), // Icono en la parte izquierda
                title: Text(personasLista.data?[index]
                    ["nombre"]), // Título del elemento
                subtitle:
                    Text('john.doe@example.com'), // Subtítulo del elemento
                // Icono en la parte derecha
                onTap: () async {
                  await Navigator.pushNamed(context, '/edit', arguments: {
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
 */







