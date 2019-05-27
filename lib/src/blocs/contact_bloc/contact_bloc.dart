import 'package:rxdart/rxdart.dart';

import '../../models/contact.dart';
import '../../service/contact_service.dart';

class ContactManager {
  Observable<List<Contact>> get fetchContactList => _collectionSubject.stream;
  Sink<String> get inFilter => _filterSubject.sink;
  Observable<int> get contactCounter => _counterSubject.stream;

  ContactManager() {
    _filterSubject.listen((filter) async {
      var contacts = await ContactService.fetchAll(query: filter);
      _collectionSubject.add(contacts);
    });
    _collectionSubject.listen((list) => _counterSubject.add(list.length));
  }

  final PublishSubject<List<Contact>> _collectionSubject =
      PublishSubject<List<Contact>>();
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<int> _counterSubject = PublishSubject<int>();

  void dispose() {
    _collectionSubject.close();
    _counterSubject.close();
    _filterSubject.close();
  }
}
