import 'package:email_client/src/widgets/counter_show.dart';
import 'package:email_client/src/widgets/increment_btn.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/email_drawer.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IncrementButton(),
        appBar: AppBar(title: Text('Calendar')),
        drawer: EmailDrawer(),
        body: CounterShow());
  }
}
