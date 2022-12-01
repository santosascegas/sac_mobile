import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class FaleConoscoService {
  static Future<Response> sendFaleConosco(Map<String, String> data) async {
    final p = await post(
      Uri.parse("http://localhost:8080/fale-conosco/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String> {
        'name': data["name"],
        'email': data["email"],
        'phone': data["phone"],
        'subject': data["subject"],
        'message': data["message"],
      })
    );

    return p;
  }
}