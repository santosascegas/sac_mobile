import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
      ),
      body: Stack(children: <Widget>[
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[],
        )
      ]),
    );
  }
}
