import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BlogService {
  static Future<List<dynamic>> getPostagens() async {
    Response res = await get(Uri.parse("http://localhost:8080/post/"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      return body;
    } else {
      throw "Can't get blog posts.";
    }
  }

}