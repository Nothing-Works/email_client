import 'package:email_client/src/blocs/contacts_bloc/contact_bloc.dart';

import 'blocs/contacts_bloc/calendar_counter_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CalendarCounterManager, CalendarCounterManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}
