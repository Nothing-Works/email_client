import 'dart:async';

import '../../models/contact.dart';
import '../../service/contact_service.dart';

class ContactManager {
  Stream<List<Contact>> get contactListNow async* {
    yield await ContactService.fetchAll();
  }

  ContactManager() {
    contactListNow.listen((list) => _counterController.add(list.length));
  }

  final StreamController<int> _counterController = StreamController<int>();
  Stream<int> get contactCounter => _counterController.stream;
}
