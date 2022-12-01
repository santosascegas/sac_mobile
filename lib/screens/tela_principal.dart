import 'package:flutter/material.dart';

import 'package:santos_as_cegas/widgets/custom_button.dart';
import 'package:santos_as_cegas/widgets/custom_expandable.dart';

class TelaPrincipal extends StatefulWidget {
  final PageController controller;

  const TelaPrincipal({Key key, @required this.controller}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Bem-vindo!",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Container(padding: new EdgeInsets.all(15.0), child: CustomButton(controller: widget.controller, page: 2)),
        Container(padding: new EdgeInsets.all(15.0), child: CustomExpandable()),
        Container(
          padding: new EdgeInsets.all(15.0),
        )
      ],
    ));
  }
}
