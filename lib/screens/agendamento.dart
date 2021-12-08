import 'package:flutter/material.dart';

import 'package:santos_as_cegas/util/datas_data.dart';
import 'package:santos_as_cegas/screens/fale_conosco.dart';
import 'package:santos_as_cegas/screens/agendamento_cadastro.dart';

class Agendamento extends StatefulWidget {
  final PageController controller;

  const Agendamento({Key key, @required this.controller}) : super(key: key);

  @override
  _AgendamentoState createState() {
    return _AgendamentoState();
  }
}

class _AgendamentoState extends State<Agendamento> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Agendamento",
            style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(15.0),
          child: Text(
            "Escolha uma data disponível",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(
          child: buildDates(),
        ),
        Padding(
          padding: new EdgeInsets.all(10.0),
          child: Text("Se você não encontrou uma data desejada, entre em contato conosco para verificar a disponibilidade da data desejada.", style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          onPressed: () {
            widget.controller.jumpToPage(4);
          },
          child: const Text('Entrar em Contato'),
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                width: 1.0,
                color: Colors.black,
              ),
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ],
    );
  }

  buildDates() {
    return Container(
        height: 300,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 1),
          children: datasData
              .map((data) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgendamentoCadastro()));
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.red, // red as border color
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text(data["data_date"], style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                          Center(child: Text(data["data_time"], style: TextStyle(fontSize: 15, color: Colors.black), textAlign: TextAlign.center))
                        ],
                      ))))
              .toList(),
        ));
  }
}
