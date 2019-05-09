import 'package:email_client/src/blocs/calendar_bloc/calendar_counter_manager.dart';
import 'package:flutter/material.dart';

import '../provider.dart';

class CounterShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarCounterManager manager =
        Provider.of(context).fetch(CalendarCounterManager);

    return Center(
        child: StreamBuilder<int>(
            initialData: 0,
            stream: manager.calendarCounter,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                Text('Calendar: ${snapshot.data}')));
  }
}
