import 'package:flutter/material.dart';

import 'package:santos_as_cegas/widgets/trajeto.dart';
import 'package:santos_as_cegas/util/trajetos_data.dart';

class Trajetos extends StatefulWidget {
  const Trajetos({Key key}) : super(key: key);

  @override
  _TrajetosState createState() {
    return _TrajetosState();
  }
}

class _TrajetosState extends State<Trajetos> {
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
            "Observe a seguir as paradas do trajeto do Santos às cegas.",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(child: buildTrajetoList())
      ],
    );
  }

  buildTrajetoList() {
    return Padding(
        padding: new EdgeInsets.all(15.0),
        child: Container(
          height: 100.0,
          child: ListView.builder(
            itemCount: trajetosData.length,
            itemBuilder: (BuildContext context, int index) {
              Map trajeto = trajetosData.toList()[index];
              return Trajeto(
                trajetoLocal: trajeto,
              );
            },
          ),
        ));
  }
}
