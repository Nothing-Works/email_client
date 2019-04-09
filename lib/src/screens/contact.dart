import 'package:flutter/material.dart';

import '../widgets/drawer/email_drawer.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contacts')),
        drawer: EmailDrawer(),
        body: Center(child: Text('Contacts')));
  }
}
