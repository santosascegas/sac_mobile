import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AgendamentoEnvio {
  static Future<Response> marcarTrajeto(Map<String, String> data) async {
    final p = await post(
        Uri.parse("http://localhost:8080/agendamento/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic> {
          'doctors_note': data["doctors_note"],
          'email': data["email"],
          'id_document': data["id_document"],
          'name': data["name"],
          'phone': data["phone"],
          'agenda': {
            'id': data["date_id"],
            'date': data["date_date"]
          },
        })
    );

    return p;
  }
}