import 'package:email_client/src/blocs/calendar_bloc/calendar_counter_manager.dart';
import 'package:flutter/material.dart';

import '../provider.dart';

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarCounterManager manager =
        Provider.of(context).fetch(CalendarCounterManager);
    return FlatButton(onPressed: manager.increment, child: Icon(Icons.add));
  }
}
