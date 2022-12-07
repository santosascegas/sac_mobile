import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:santos_as_cegas/util/form_data.dart';

import 'package:santos_as_cegas/util/termos_data.dart';
import 'package:santos_as_cegas/widgets/termos.dart';
import 'package:santos_as_cegas/widgets/custom_divider.dart';
import 'package:santos_as_cegas/screens/main_screen.dart';

import '../util/agendamento_envio.dart';

class AgendamentoParticipacao extends StatefulWidget {
  final appointment;
  final cadastro;
  final atestado;

  const AgendamentoParticipacao({Key key, @required this.appointment, @required this.cadastro, @required this.atestado}) : super(key: key);

  @override
  _AgendamentoParticipacao createState() {
    print(appointment["date"].toString());
    print(cadastro.toString());
    print(atestado.toString());
    return _AgendamentoParticipacao();
  }
}

class _AgendamentoParticipacao extends State<AgendamentoParticipacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Consentimento de Participação', style: TextStyle(color: Colors.white, fontSize: 18)),
            centerTitle: true,
            backgroundColor: Colors.red,
            elevation: 0,
            actions: <Widget>[],
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: <Color>[
              Color(0xff8c1401),
              Color(0xffff3f21)
            ])))),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomDivider(),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Uso de imagem e acidentes",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
          Expanded(flex: 1, child: buildTermosList()),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () {
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.white,
                    barrierDismissible: true,
                    barrierLabel: 'Dialog',
                    transitionDuration: Duration(milliseconds: 200), // How long it takes to popup dialog after button click
                    pageBuilder: (_, __, ___) {
                      return Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FutureBuilder<Response>(
                              future: _sendRequest(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (!snapshot.hasError &&
                                      snapshot.data.statusCode == 200) {
                                    return Center(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: new EdgeInsets.all(25.0),
                                              child: Text("Agendamento realizado com sucesso!", style: TextStyle(fontSize: 24.0, color: Color(0xff007E03)), textAlign: TextAlign.center),
                                            ),
                                            Container(
                                              height: 150,
                                              child: SizedBox.expand(
                                                child: Image.asset(
                                                  "assets/sucesso_email.png",
                                                  height: 2,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: new EdgeInsets.all(25.0),
                                              child: Text("Você receberá um e-mail de condirmação em instantes com algumas dicas sobre o trajeto.", style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.center),
                                            ),
                                            ElevatedButton(
                                              onPressed: () => makeRoutePage(context: context, pageRef: MainScreen()),
                                              style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.black, backgroundColor: Colors.white, side: BorderSide(
                                                width: 1.0,
                                                color: Colors.black,
                                              ),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
                                              child: Text('Voltar'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 150,
                                              child: SizedBox.expand(
                                                child: Image.asset(
                                                  // Trocar imagem para um email com um X para indicar que nao deu certo
                                                  "assets/mensagem-de-erro.png",
                                                  height: 2,
                                                  width: 2,
                                                  // fit: BoxFit.,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              EdgeInsets.only(top: 25),
                                              child: Text(
                                                  "Infelizmente não conseguimos marcar o seu trajeto! Por favor, tente novamente mais tarde.",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.red,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                  textAlign:
                                                  TextAlign.center),
                                            ),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              style:
                                              ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                  Colors.black,
                                                  backgroundColor:
                                                  Colors.white,
                                                  side: BorderSide(
                                                    width: 1.0,
                                                    color: Colors.black,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          50)),
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      20,
                                                      vertical: 20),
                                                  textStyle: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      color: Colors
                                                          .black)),
                                              child: Text('Voltar'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  return Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(top: 25),
                                            child: Text("Enviando...",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign:
                                                TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text('Finalizar'),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white, side: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black))),
          ),
        ]));
  }

  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => pageRef), (Route<dynamic> route) => false);
  }

  void test() {
    for (var item in formData) {
      print(item);
    }
  }

  Future<Response> _sendRequest() async {
    Map<String, String> data = new Map();
    data['doctors_note'] = widget.atestado ? "1" : "0";
    data['email'] = widget.cadastro.email.toString();
    data['id_document'] = widget.cadastro.document.toString();
    data['name'] = widget.cadastro.name.toString();
    data['phone'] = widget.cadastro.phone.toString();
    data['date_id'] = widget.appointment["id"].toString();
    data['date_date'] = widget.appointment["date"].toString();

    return AgendamentoEnvio.marcarTrajeto(data);
  }

  buildTermosList() {
    return Container(
      // height: 500.0,
      child: ListView.builder(
        itemCount: termosData.length,
        itemBuilder: (BuildContext context, int index) {
          Map termo = termosData.toList()[index];
          return Termos(
            termoLocal: termo,
          );
        },
      ),
    );
  }
}
