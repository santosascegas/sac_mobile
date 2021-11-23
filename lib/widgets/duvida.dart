import 'package:flutter/material.dart';

class Duvida extends StatelessWidget {
  final Map duvidaLocal;

  Duvida({this.duvidaLocal});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: new EdgeInsets.all(8.0),
        child: Text(
          "${duvidaLocal["titulo"]}",
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      Padding(
        padding: new EdgeInsets.all(8.0),
        child: Text(
          "${duvidaLocal["desc"]}",
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      )
    ]);
  }
}
