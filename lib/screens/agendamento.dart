import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:santos_as_cegas/util/agendamento_service.dart';
import 'package:santos_as_cegas/screens/agendamento_cadastro.dart';

class Agendamento extends StatelessWidget {
  final PageController controller;

  const Agendamento({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
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
        FutureBuilder(future: AgendamentoService.getAgendas("http://localhost:8080/agenda/status"),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              List<dynamic> agendas = snapshot.data;
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (2/1),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: agendas.map(
                        (obj) => GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgendamentoCadastro(appointment: obj,))),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Text(dataISO(obj["date"].toString()), style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),),
                            Center(child: Text(horaISO(obj["date"].toString()), style: TextStyle(fontSize: 15, color: Colors.black),),),
                          ],
                        ),
                      ),
                    )
                ).toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        Padding(
          padding: new EdgeInsets.all(10.0),
          child: Text("Se você não encontrou uma data desejada, entre em contato conosco para verificar a disponibilidade da data desejada.", style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.center),
        ),
        ElevatedButton(
          onPressed: () {
            controller.jumpToPage(5);
          },
          child: const Text('Entrar em Contato'),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.white, side: BorderSide(
            width: 1.0,
            color: Colors.black,
          ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ],
    ),);
  }

  String horaISO(String iso) {
    DateTime utcTime = DateTime.parse(iso);
    DateTime localTime = utcTime.toLocal();
    DateFormat formatter = DateFormat('HH:mm');
    return "${formatter.format(localTime)}";
  }

  String dataISO(String iso) {
    DateTime utcTime = DateTime.parse(iso);
    DateTime localTime = utcTime.toLocal();
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return "${formatter.format(localTime)}";
  }
}