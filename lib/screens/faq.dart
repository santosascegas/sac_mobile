import 'package:flutter/material.dart';

import 'package:santos_as_cegas/widgets/duvida.dart';
import 'package:santos_as_cegas/util/duvidas_data.dart';

class Faq extends StatefulWidget {
  const Faq({Key key}) : super(key: key);

  @override
  _FaqState createState() {
    return _FaqState();
  }
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Dúvidas Frequentes",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Expanded(
          flex: 1,
          child: buildFaqList(),
        )
      ],
    );
  }

  buildFaqList() {
    return Container(
      height: 500.0,
      child: ListView.builder(
        itemCount: duvidasData.length,
        itemBuilder: (BuildContext context, int index) {
          Map duvida = duvidasData.toList()[index];
          return Duvida(
            duvidaLocal: duvida,
          );
        },
      ),
    );
  }
}
