import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../models/contact.dart';
import '../../service/contact_service.dart';

class ContactManager {
  Stream<List<Contact>> get fetchContactList => _collectionSubject.stream;
  Sink<String> get inFilter => _filterSubject.sink;
  Stream<int> get contactCounter => _counterSubject.stream;

  ContactManager() {
    _filterSubject.stream.listen((filter) async {
      var contacts = await ContactService.fetchAll(query: filter);
      _collectionSubject.add(contacts);
    });
    _collectionSubject.listen((list) => _counterSubject.add(list.length));
  }

  final PublishSubject<List<Contact>> _collectionSubject =
      PublishSubject<List<Contact>>();
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _counterSubject = BehaviorSubject<int>();

  void dispose() {
    _collectionSubject.close();
    _counterSubject.close();
    _filterSubject.close();
  }
}
