import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactService {
  static Future<List<Contact>> fetchAll({String query = ''}) async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      var original = list.map((json) => Contact.fromJson(json)).toList();

      if (query != '') {
        return original.where((Contact contact) {
          return contact.name.contains(query);
        }).toList();
      } else {
        return original;
      }
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
