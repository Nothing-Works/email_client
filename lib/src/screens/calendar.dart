import 'package:flutter/material.dart';

import '../widgets/drawer/email_drawer.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Calendar')),
        drawer: EmailDrawer(),
        body: Center(child: Text('Calendar')));
  }
}
