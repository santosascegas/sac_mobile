import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

import 'package:santos_as_cegas/screens/agendamento_participacao.dart';
import 'package:santos_as_cegas/screens/agendamento_form.dart';

class AgendamentoCadastro extends StatefulWidget {
  const AgendamentoCadastro({Key key}) : super(key: key);

  @override
  _AgendamentoCadastroState createState() {
    return _AgendamentoCadastroState();
  }
}

class _AgendamentoCadastroState extends State<AgendamentoCadastro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Fechar',
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: new EdgeInsets.all(15.0),
                child: Text(
                  "Cadastro",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(15.0),
                child: Text(
                  "Preencha com suas informações",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Número do RG ou RNE',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Número do RG ou RNE obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                child: ElevatedButton(
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black54,
                        barrierLabel: 'Agendamento',
                        transitionDuration: Duration(milliseconds: 200), // How long it takes to popup dialog after button click
                        pageBuilder: (_, __, ___) {
                          // Makes widget fullscreen
                          return Scaffold(
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: SizedBox.expand(
                                    child: Image.asset(
                                      "assets/mensagem-de-erro.png",
                                      height: 2,
                                      width: 2,
                                      // fit: BoxFit.,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: new EdgeInsets.all(25.0),
                                  child: Text("Caso você tenha responda SIM no questionário, sua participação estará condicionada a apresentação de um atestado médico no dia do seu trajeto.", style: TextStyle(fontSize: 16.0, color: Colors.black), textAlign: TextAlign.center),
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: ElevatedButton(
                                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgendamentoForm())),
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
                                      child: Text('Continuar'),
                                    ),
                                  )
                                ])
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Próximo'),
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
