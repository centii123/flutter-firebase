import 'package:firebase/services/firebaseService.dart';
import 'package:firebase/variables/variablesGlobales.dart';
import 'package:flutter/material.dart';

class agregar extends StatefulWidget {
  const agregar({super.key});

  @override
  State<agregar> createState() => _agregarState();
}

class _agregarState extends State<agregar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Ingrese el nombre',
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey[500],
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
    );
  }
}

class botonesAdd extends StatefulWidget {
  const botonesAdd({super.key});

  @override
  State<botonesAdd> createState() => _botonesAddState();
}

class _botonesAddState extends State<botonesAdd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/");
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('ATRAS'),
        ),
        ElevatedButton(
          onPressed: () {
            addPersona(controlador.text).then((_) {
              Navigator.popAndPushNamed(context, "/");
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('AGREGAR'),
        ),
      ],
    );
  }
}
