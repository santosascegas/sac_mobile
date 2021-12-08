import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

import 'dart:io';

class FaleConosco extends StatefulWidget {
  const FaleConosco({Key key}) : super(key: key);

  @override
  _FaleConoscoState createState() {
    return _FaleConoscoState();
  }
}

class _FaleConoscoState extends State<FaleConosco> {
  final _formKey = GlobalKey<FormState>();

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
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          Padding(
            padding: new EdgeInsets.all(15.0),
            child: Text(
              "Será um prazer ouvi-lo, sua opinião é muito importante para o nosso trabalho",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
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
            ),
          ),
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
                      // Makes widget fullscreen
                      return Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: new EdgeInsets.all(25.0),
                              child: Text("Sua mensagem foi enviada com sucesso!", style: TextStyle(fontSize: 20.0, color: Color(0xff007E03)), textAlign: TextAlign.center),
                            ),
                            Container(
                              height: 150,
                              child: SizedBox.expand(
                                child: Image.asset(
                                  "assets/email.png",
                                  height: 2,
                                  width: 2,
                                  // fit: BoxFit.,
                                ),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.all(25.0),
                              child: Text("Nós responderemos o mais rápido possível.", style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.center),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
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
                              child: Text('Voltar'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text('Enviar'),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black))),
          ),
        ],
      ),
    ));
  }
}
