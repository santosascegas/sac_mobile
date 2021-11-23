import 'package:flutter/material.dart';

class Trajeto extends StatefulWidget {
  const Trajeto({Key key}) : super(key: key);

  @override
  _TrajetoState createState() {
    return _TrajetoState();
  }
}

class _TrajetoState extends State<Trajeto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Trajeto",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Observe no mapa e nas fotos a seguir as paradas do trajeto do Santos às cegas.",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Container(
          height: 250,
          width: 330,
          child: ClipRRect(
            child: Image.asset(
              "assets/trajeto/maps-template.png",
              height: 250,
              width: 330,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  buildTrajetoList() {
    return Container();
  }
}
