import 'package:flutter/material.dart';

class Trajeto extends StatelessWidget {
  final Map trajetoLocal;

  Trajeto({this.trajetoLocal});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red, // red as border color
          ),
        ),
        child: Row(children: [
          Container(
            height: 75,
            width: 55,
            child: ClipRRect(
              child: Image.asset(
                "${trajetoLocal["img"]}",
                height: 75,
                width: 55,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(8.0),
            child: Text(
              "${trajetoLocal["nome"]}",
              style: TextStyle(fontSize: 15.0, color: Colors.red),
            ),
          )
        ]));
  }
}
