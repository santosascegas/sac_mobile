import 'package:flutter/material.dart';

class Trajeto extends StatelessWidget {
  final Map trajetoLocal;

  Trajeto({this.trajetoLocal});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: new EdgeInsets.only(bottom: 15.0),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red, // red as border color
              ),
            ),
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(right: 10.0),
                height: 75,
                width: 75,
                child: ClipRRect(
                  child: Image.asset(
                    "${trajetoLocal["img"]}",
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "${trajetoLocal["nome"]}",
                  style: TextStyle(fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${trajetoLocal["desc"]}",
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                ),
              ])),
            ])));
  }
}
