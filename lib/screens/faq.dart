import 'package:flutter/material.dart';

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
    return ListView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Dúvidas Frequentes",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "O trajeto ocorre todos os dias?",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Não. Os trajetos têm agendamentos prévios às terças-feiras às 14h30 e quartas-feiras às 9h30. Demais dias e horários, favor consultar pelo Fale Conosco.",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "O trajeto é só para pessoas com deficiência?",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Não. O passeio busca atender todas as pessoas tomando os cuidados específicos relacionados a atividade física. Saiba mais no preenchimento da inscrição.",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
