import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'package:santos_as_cegas/util/faleconosco_service.dart';

class FaleConosco extends StatefulWidget {
  const FaleConosco({Key key}) : super(key: key);

  @override
  _FaleConoscoState createState() {
    return _FaleConoscoState();
  }
}

class _FaleConoscoState extends State<FaleConosco> {
  final _formKey = GlobalKey<FormState>();
  String nome, email, telefone, assunto, msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Fale Conosco",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Será um prazer ouvi-lo, sua opinião é muito importante para o nosso trabalho",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nome obrigatorio';
                }
                return null;
              },
              onSaved: (String val) => nome = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'E-mail obrigatorio';
                }
                return null;
              },
              onSaved: (String val) => email = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Telefone obrigatório';
                }
                return null;
              },
              onSaved: (String val) => telefone = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Assunto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Assunto obrigatório';
                }
                return null;
              },
              onSaved: (String val) => assunto = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mensagem',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mensagem obrigatória';
                }
                return null;
              },
              onSaved: (String val) => msg = val,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: ElevatedButton(
                child: const Text("Enviar"),
                onPressed: () => {
                      showGeneralDialog(
                        context: context,
                        barrierColor: Colors.white,
                        barrierDismissible: true,
                        barrierLabel: 'Dialog',
                        transitionDuration: Duration(
                            milliseconds:
                                200), // How long it takes to popup dialog after button click
                        pageBuilder: (_, __, ___) {
                          // Makes widget fullscreen
                          return Scaffold(
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FutureBuilder<Response>(
                                  future: _sendFaleConosco(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (!snapshot.hasError &&
                                          snapshot.data.statusCode == 200) {
                                        return Center(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      new EdgeInsets.all(25.0),
                                                  child: Text(
                                                      "Sua mensagem foi enviada com sucesso!",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Color(
                                                              0xff007E03)),
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                                Container(
                                                  height: 150,
                                                  child: SizedBox.expand(
                                                    child: Image.asset(
                                                      // Trocar imagem para um email com um X para indicar que nao deu certo
                                                      "assets/email.png",
                                                      height: 2,
                                                      width: 2,
                                                      // fit: BoxFit.,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      new EdgeInsets.all(25.0),
                                                  child: Text(
                                                      "Nós responderemos o mais rápido possível.",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black),
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
                                                      "assets/email.png",
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
                                                      "Infelizmente não conseguimos enviar sua mensagem! Por favor, tente novamente mais tarde.",
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
                      )
                    },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
          ),
        ],
      ),
    ));
  }

  Future<Response> _sendFaleConosco() async {
    _formKey.currentState.save();
    Map<String, String> data = new Map();
    data['name'] = nome;
    data['email'] = email;
    data['phone'] = telefone;
    data['subject'] = assunto;
    data['message'] = msg;

    return FaleConoscoService.sendFaleConosco(data);
  }
}
