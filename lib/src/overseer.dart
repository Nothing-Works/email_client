import 'blocs/calendar_bloc/calendar_counter_manager.dart';
import 'blocs/contact_bloc/contact_bloc.dart';

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
