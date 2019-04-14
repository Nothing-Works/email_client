import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactService {
  static Future<List<Contact>> fetchAll() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      return list.map((json) => Contact.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
