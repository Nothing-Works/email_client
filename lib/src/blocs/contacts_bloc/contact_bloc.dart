import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../models/contact.dart';
import '../../service/contact_service.dart';

class ContactManager {
  Stream<List<Contact>> get contactListNow =>
      Stream.fromFuture(ContactService.fetchAll());

  Stream<List<Contact>> filteredContactList({String query}) {
    return Stream.fromFuture(ContactService.fetchAll(query: query));
  }

  ContactManager() {
    contactListNow.listen((list) => _counterController.add(list.length));
  }

  final BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  Stream<int> get contactCounter => _counterController.stream;

  void dispose() => _counterController.close();
}
