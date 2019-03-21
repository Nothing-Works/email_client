import 'dart:convert';

import 'package:email_client/src/models/email.dart';
import 'package:http/http.dart' as http;

class EmailRepository {
  static Future<List<Email>> fetchAll() async {
    var response =
        await http.get('http://www.mocky.io/v2/5c93497c3100006e005543d4');
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((json) => Email.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
