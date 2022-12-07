import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:santos_as_cegas/util/form_data.dart';

import 'agendamento_participacao.dart';

class AgendamentoForm extends StatefulWidget {
  final appointment;
  final cadastro;
  const AgendamentoForm(
      {Key key, @required this.appointment, @required this.cadastro})
      : super(key: key);

  @override
  _AgendamentoFormState createState() {
    print(this.appointment.toString());
    print(this.cadastro.name.toString());
    return _AgendamentoFormState();
  }
}

class _AgendamentoFormState extends State<AgendamentoForm> {
  List doctorsNote = List.filled(formData.length, null);
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Visibility(
                visible: error,
                child: Text(
                  "Por favor responda todas as perguntas para continuar!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )),
          ),
          Flexible(
              child: ListView(
            shrinkWrap: true,
            children: [
              for (int x = 0; x < formData.length; x++)
                create_question(formData[x], x)
            ],
          )),
          Padding(padding: const EdgeInsets.all(15)),
          SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: const Text("Próximo"),
                onPressed: () => {
                  if (doctorsNote.contains(null))
                    {
                      setState(() => {error = true}),
                      SemanticsService.announce(
                          "Erro. Por favor responda todas as perguntas para continuar!",
                          TextDirection.ltr)
                    }
                  else
                    {
                      setState(() => {error = false}),
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AgendamentoParticipacao(
                                appointment: widget.appointment,
                                cadastro: widget.cadastro,
                                atestado:
                                    doctorsNote.contains(true) ? true : false,
                              )))
                    }
                },
              )),
          Padding(padding: const EdgeInsets.all(15)),
        ],
      ),
    );
  }

  Widget create_question(String str, int id) {
    return Container(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(5)),
          Text(str.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 180,
                  height: 80,
                  child: RadioListTile(
                    title: Text("Sim"),
                    value: true,
                    groupValue: doctorsNote[id],
                    onChanged: (dynamic value) {
                      setState(() {
                        doctorsNote[id] = value;
                      });
                    },
                  )),
              SizedBox(
                  width: 180,
                  height: 80,
                  child: RadioListTile(
                    title: Text("Não"),
                    value: false,
                    groupValue: doctorsNote[id],
                    onChanged: (dynamic value) {
                      setState(() {
                        doctorsNote[id] = value;
                      });
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
