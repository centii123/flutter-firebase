import 'package:firebase/components/appbar.dart';
import 'package:firebase/components/listar.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text("BIENVENIDO / A",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white)),
            const SizedBox(
              height: 25,
            ),
            lista(),
          ],
        ),
      ),
    );
  }
}
