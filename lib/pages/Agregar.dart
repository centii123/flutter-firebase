import 'package:firebase/components/agregar.dart';
import 'package:flutter/material.dart';

class addPersona extends StatelessWidget {
  const addPersona({super.key});

  @override
  Widget build(BuildContext context) {
  
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
            agregar(),
            SizedBox(
              height: 20,
            ),
            botonesAdd()
          ],
        ),
      ),
    );
  }
}
