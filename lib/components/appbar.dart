import 'package:flutter/material.dart';

AppBar myAppbar(context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 39, 39, 39),
    title: const Text("Crud con firebase Sebastian Mera"),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/add");
          },
          icon: Icon(Icons.person_add))
    ],
  );
}
