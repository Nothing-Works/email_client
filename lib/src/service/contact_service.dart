import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactService {
  static Future<List<Contact>> fetchAll({String query}) async {
    var response = await http.get('http://localhost:5544/users?q=$query');

    if (response.statusCode == 200) {
      List list = jsonDecode(response.body);
      Iterable<Contact> _contacts = list.map((json) => Contact.fromJson(json));

//      if (query != null && query.isNotEmpty) {
//        _contacts = _contacts.where((contact) =>
//            contact.name.toLowerCase().contains(query.trim().toLowerCase()));
//      }
      return _contacts.toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
