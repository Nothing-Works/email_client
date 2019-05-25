import 'package:email_client/src/blocs/calendar_bloc/calendar_counter_manager.dart';
import 'package:email_client/src/blocs/observer.dart';
import 'package:flutter/material.dart';

import '../provider.dart';

class CounterShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarCounterManager manager =
        Provider.of(context).fetch(CalendarCounterManager);

    return Center(
        child: Observer<int>(
            stream: manager.calendarCounter,
            onSuccess: (context, data) => Text('Calendar Andy: $data')));
  }
}
