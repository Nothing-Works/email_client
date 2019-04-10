import 'package:flutter/material.dart';

import '../blocs/contacts_bloc/contact_bloc.dart';
import '../widgets/drawer/email_drawer.dart';

class ContactPage extends StatelessWidget {
  final manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            Chip(
                label: StreamBuilder(
                    stream: manager.contactListNow,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>> snapshot) {
                      var count = snapshot.data?.length ?? 0;
                      return Text(count.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold));
                    }),
                backgroundColor: Colors.red),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
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
