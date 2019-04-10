import 'dart:async';

List<String> contactsUsers = ['User1', 'User2', 'User3'];

class ContactManager {
  Stream<List<String>> get contactListNow async* {
    for (var i = 0; i < contactsUsers.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield contactsUsers.sublist(0, i + 1);
    }
  }

  ContactManager() {
    contactListNow.listen((list) => _counterController.add(list.length));
  }

  final StreamController<int> _counterController = StreamController<int>();
  Stream<int> get contactCounter => _counterController.stream;
}
