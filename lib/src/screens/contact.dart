import 'package:flutter/material.dart';

import '../blocs/contacts_bloc/contact_bloc.dart';
import '../widgets/drawer/email_drawer.dart';

class ContactPage extends StatelessWidget {
  final manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contacts')),
        drawer: EmailDrawer(),
        body: StreamBuilder<List<String>>(
            stream: manager.contactListNow,
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              var users = snapshot.data;
              return ListView.separated(
                  itemCount: users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) =>
                      ListTile(title: Text(users[index])),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider());
            }));
  }
}
