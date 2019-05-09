import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../models/contact.dart';
import '../../service/contact_service.dart';

class ContactManager {
  Stream<List<Contact>> fetchContactList({String query}) =>
      Stream.fromFuture(ContactService.fetchAll(query: query));

  ContactManager() {
    fetchContactList().listen((list) => _counterController.add(list.length));
  }

  final BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  Stream<int> get contactCounter => _counterController.stream;

  void dispose() => _counterController.close();
}
