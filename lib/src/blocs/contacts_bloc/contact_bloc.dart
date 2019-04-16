import 'dart:async';

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

  final StreamController<int> _counterController = StreamController<int>();
  Stream<int> get contactCounter => _counterController.stream;
}
