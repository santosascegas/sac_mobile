import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<> sendFaleConosco(String nome, String email, String telefone, String assunto, String mensagem) async {
  final response = await http.post(
    Uri.parse(''),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'assunto': assunto,
      'mensagem': mensagem,
    }),
  );

  if (response.statusCode == 201) {
    return true;
  } else {
    throw Exception('Falha ao enviar mensagem.');
  }
}
