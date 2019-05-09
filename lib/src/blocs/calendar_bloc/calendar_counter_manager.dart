import 'package:rxdart/rxdart.dart';

class CalendarCounterManager {
  final BehaviorSubject<int> _counterController =
      BehaviorSubject<int>.seeded(0);

  int get _current => _counterController.value;

  Stream<int> get calendarCounter => _counterController.stream;

  void increment() => _counterController.add(_current + 1);

  void decrement() => _counterController.add(_current - 1);

  void dispose() => _counterController.close();
}
