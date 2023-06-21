import 'package:firebase/services/firebaseService.dart';
import 'package:flutter/material.dart';

class editPersona extends StatefulWidget {


  @override
  State<editPersona> createState() => _editPersonaState();
}

class _editPersonaState extends State<editPersona> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
     Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['name'];

    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Agregar Persona",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
      controller: nameController,
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
    ),
            SizedBox(
              height: 20,
            ),
            Row(
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
          onPressed: () async {
             await updatePersona(arguments['uid'], nameController.text)
                      .then((_) {
                    Navigator.pop(context);
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
          child: Text('Actualizar'),
        ),
      ],
    )
          ],
        ),
      ),
    );
  }
}
