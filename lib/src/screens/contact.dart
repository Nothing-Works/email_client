import 'package:flutter/material.dart';

import './contact_search.dart';
import '../blocs/contacts_bloc/contact_bloc.dart';
import '../widgets/contact_list.dart';
import '../widgets/drawer/email_drawer.dart';

class ContactPage extends StatelessWidget {
  final manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            StreamBuilder<int>(
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Chip(
                    backgroundColor: Colors.red,
                    label: Text('${snapshot.data ?? 0}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)));
              },
              stream: manager.contactCounter,
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: ContactSearch(manager));
                }),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        drawer: EmailDrawer(),
        body: ContactList(
            stream: manager.contactListNow,
            builder: (context, contacts) {
              return ListView.separated(
                  itemCount: contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var contact = contacts[index];
                    return ListTile(
                        leading: CircleAvatar(),
                        title: Text(contact.name),
                        subtitle: Text(contact.email));
                  },
                  separatorBuilder: (context, index) => Divider());
            }));
  }
}
