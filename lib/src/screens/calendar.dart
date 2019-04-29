import 'package:email_client/src/widgets/ugly_btn.dart';
import 'package:email_client/src/widgets/ugly_show.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer/email_drawer.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: UglyButton(),
        appBar: AppBar(title: Text('Calendar')),
        drawer: EmailDrawer(),
        body: UglyShow());
  }
}
