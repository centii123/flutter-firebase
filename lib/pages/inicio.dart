import 'package:firebase/components/appbar.dart';
import 'package:firebase/components/listar.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(context),
        body: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text("Lista",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
            const SizedBox(
              height: 25,
            ),
            lista(),
          ],
        ),
        );
  }
}
