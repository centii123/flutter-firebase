import 'package:flutter/material.dart';



AppBar myAppbar(context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: const Text("Crud con firebase"),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/add");
            
          },
          icon: Icon(Icons.person_add))
    ],
  );
}
