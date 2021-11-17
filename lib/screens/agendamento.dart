import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              "Agendamento",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
