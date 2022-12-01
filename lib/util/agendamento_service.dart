import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AgendamentoService {
  static Future<List<dynamic>> getAgendas(String url) async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      return body;
    } else {
      throw "Can't get agenda.";
    }
  }

}