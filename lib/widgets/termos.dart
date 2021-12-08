import 'package:flutter/material.dart';

class Termos extends StatelessWidget {
  final Map termoLocal;

  Termos({this.termoLocal});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: 50,
              height: 50,
              decoration: new BoxDecoration(
                color: Colors.grey[850],
                shape: BoxShape.circle,
              ),
              child: Icon(termoLocal["icon"], color: Colors.grey[400])),
          Expanded(
              child: Padding(
            padding: new EdgeInsets.only(left: 15.0),
            child: Text(
              "${termoLocal["termo"]}",
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ))
        ]));
  }
}
