import 'package:flutter/material.dart';

import 'package:santos_as_cegas/models/FaleConoscoClass';
import 'package:santos_as_cegas/api/FaleConoscoApi';

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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
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
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enviando mensagem!')),
                  );
                }
              },
              child: const Text('Enviar'),
              style: ElevatedButton.styleFrom(primary: Colors.grey, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
